require_relative 'lib/documentbuilder_script_generator'

desc 'Generate js for doc-builder-testing project'
task :generate_js_doc_builder do
  builder = DocumentbuilderScriptGenerator.new
  builder.generate_js(:document)
  builder.generate_js(:spreadsheet)
  builder.generate_js(:presentation)
end
