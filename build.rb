require 'optparse'
require 'yaml'

options = YAML.load_file('build_config.yaml')

#options[:reveal_url] = "http://127.0.0.1/reveal.js-5.1.0/"

OptionParser.new do |parser|
  parser.banner = 'Usage: build.rb [options]'

  parser.on('-m', '--markdown INPUT', 'Provide MARKDOWN filename') do |i|
    options[:markdown] = i
    if i.end_with? '.md'
      options[:markdown] = i[..-4]
    end
  end
  parser.on('--bibliography BIBLIOGRAPHY', 'Provide BIBLIOGRAPHY file') do |bibliography|
    options[:bibliography] = bibliography
  end
  parser.on('--csl CSL', 'Provide CSL file') do |csl|
    options[:csl] = csl
  end
  parser.on('-s', '--self-contained', 'Pass self-contained argument to pandoc') do |_s|
    options[:self_contained] = true
  end
  parser.on('--reveal-url REVEALURL', 'RevealJS URL') do |url|
    options[:reveal_url] = "-V revealjs-url:\"#{url}\""
  end
end.parse!

options["exclude"].each do |filename|
  if options[:markdown] == filename
    exit(0)
  end
end

arguments = "-f markdown+tex_math_double_backslash -t revealjs"
arguments += " #{options[:markdown]}.md -o #{options[:markdown]}.html"
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
  arguments += " --mathml #{options[:reveal_url]}"
end
# arguments += " -H #{options["assets"]}/custom_header.html -A #{options["assets"]}/custom_after_body.html"

`pandoc #{arguments}`
