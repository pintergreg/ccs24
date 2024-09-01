require 'optparse'
require 'yaml'

options = YAML.load_file('build_config.yaml')

OptionParser.new do |parser|
  parser.banner = 'Usage: build.rb [options]'

  parser.on('-m', '--markdown INPUT', 'Provide MARKDOWN filename') do |i|
    options["markdown"] = i
    if i.end_with? '.md'
      options["markdown"] = i[..-4]
    end
  end
  parser.on('--bibliography BIBLIOGRAPHY', 'Provide BIBLIOGRAPHY file') do |bibliography|
    options["bibliography"] = bibliography
  end
  parser.on('--csl CSL', 'Provide CSL file') do |csl|
    options["csl"] = csl
  end
  parser.on('-e', '--embed-resources', 'embed resources') do |_s|
    options["embed_resources"] = true
  end
  parser.on('--reveal-url REVEALURL', 'RevealJS URL') do |url|
    options["reveal_url"] = "-V revealjs-url:\"#{url}\""
  end
end.parse!

options["exclude"].each do |filename|
  if options["markdown"] == filename
    exit(0)
  end
end

arguments = "-f markdown+tex_math_double_backslash -t revealjs"
arguments += " #{options["markdown"]}.md -o #{options["markdown"]}.html"
if options["embed_resources"]
arguments += " --embed-resources"
end
arguments += " --standalone"
arguments += " --slide-level 2"
arguments += " --css #{options["assets"]}/custom.css"
if options["citeproc"]
  arguments += " --citeproc --csl #{options["csl"]}"
end
options["bibliography"].each do |bibfile|
  arguments += " --bibliography #{bibfile}"
end
if options["mathml"]
  arguments += " --mathml #{options["reveal_url"]}"
end
# arguments += " -H #{options["assets"]}/custom_header.html -A #{options["assets"]}/custom_after_body.html"

`pandoc #{arguments}`
