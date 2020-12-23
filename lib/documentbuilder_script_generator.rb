# frozen_string_literal: true

require 'nokogiri'
require 'onlyoffice_file_helper'
require_relative 'documentbuilder_script_generator/string_extension'

# Class for generating DocumentBuilder from source
class DocumentbuilderScriptGenerator
  PRODUCTS = { spreadsheet: 'xlsx', document: 'docx', presentation: 'pptx' }.freeze
  PRODUCT_FOLDER = { spreadsheet: 'Spreadsheetapi', document: 'Textdocumentapi', presentation: 'Presentationapi' }.freeze

  def initialize(api_onlyoffice_repo_path: nil, output_dir: nil)
    @input_dir = api_onlyoffice_repo_path || "#{ENV['HOME']}/sources/api.onlyoffice.com/web/Views/DocBuilder/"
    @output_dir = output_dir || "#{ENV['HOME']}/sources/doc-builder-testing/asserts/js"
  end

  def generate_js(product)
    files = OnlyofficeFileHelper::FileHelper.list_file_in_directory("#{@input_dir}/#{PRODUCT_FOLDER[product]}")
    files.each do |file|
      file_name = "#{parse_method_name(file)}.js"
      next if file_excluded?(file_name)

      folder_path = "#{@output_dir}/#{PRODUCTS[product]}/smoke/#{file.split('/')[-2].to_underscore}"
      file_path = "#{folder_path}/#{file_name}"
      code = parse_page_code(file)
      next unless code

      OnlyofficeFileHelper::FileHelper.create_folder(folder_path)
      OnlyofficeFileHelper::FileHelper.create_file_with_content(file_path: file_path, content: code)
    end
  end

  # Check if file should be excluded
  # @param file_name [String] file path
  # @return [True, False] is excluded
  def file_excluded?(file_name)
    return true if file_name.start_with?('api_')
    return true if file_name.start_with?('structure_of')
    return true if file_name == 'api.js'

    false
  end

  def parse_page_code(link)
    html = Nokogiri::HTML.parse(File.read(link))
    pre_tag = html.search('//pre')
    return nil if pre_tag.empty?

    "#{pre_tag.text.strip.gsub(/\r\n?/, "\n")}\n"
  end

  def parse_method_name(link)
    html = Nokogiri::HTML.parse(File.read(link))
    html.search('//h1/span').first.text.to_s.to_underscore
  end
end
