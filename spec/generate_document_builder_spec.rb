require 'spec_helper'

describe GenerateDocumentBuilder do
  folder_path = '/tmp/generate_js'

  before :all do
    GenerateDocumentBuilder.new(output_dir: folder_path).generate_js(:spreadsheet)
  end

  it '#generate_js do not generate files for classes' do
    files = OnlyofficeFileHelper::FileHelper.list_file_in_directory(folder_path)
    expect(files).not_to include("#{folder_path}/xlsx/smoke/spreadsheetapi/api_bullet.js")
  end

  it '#generate_js do not generate example files' do
    files = OnlyofficeFileHelper::FileHelper.list_file_in_directory(folder_path)
    expect(files).not_to include("#{folder_path}/xlsx/smoke/spreadsheetapi/api_run.js")
  end

  it '#generate_js do not generate default files' do
    files = OnlyofficeFileHelper::FileHelper.list_file_in_directory(folder_path)
    expect(files).not_to include("#{folder_path}/xlsx/smoke/spreadsheetapi/api.js")
  end

  it '#generate_js output files not containg windows crlf files' do
    expect(File.read("#{folder_path}/xlsx/smoke/api_para_pr/set_tabs.js")).not_to include("\r\n")
  end

  after :all do
    OnlyofficeFileHelper::FileHelper.delete_directory(folder_path)
  end
end
