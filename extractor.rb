require 'rubygems'
require 'fluentxpath'
require 'json'
require 'nokogiri'
require 'open-uri'
require 'pathname'
require 'sinatra'
require 'yaml'

LIBRARY_DIR = Pathname.new("library")

get '/*' do
  content_type 'application/x-yaml', :charset => 'utf-8'
  path = (params[:splat][0]).gsub(%r|/$|, "") + ".rb"
  program = Librarian.new.retrieve(path)
  program.run(params)
end

class Librarian
  def retrieve(path)
    text = (LIBRARY_DIR + path).read
    return Program.new(text)
  end
end

class Program
  def initialize(text)
    @text = text
    @title = ""; @paragraphs = []; @links = []
  end

  def run(params)
    xpath = Fluentxpath::XPath
    eval(@text)
    YAML::dump({"title" => @title, "paragraphs" => @paragraphs, "links" => @links, "status_code" => 200})
  end

  private
  def fetch(url)
    Nokogiri::HTML(open(url))
  end

  def add_link_from(node)
    link = {"text" => inner_xml_of(node), "url" => node.xpath("@href").to_s}
    @links << link
    return link
  end
  
  def add_link(text, url)
    @links << {"text" => text, "url" => url}
  end

  def inner_xml_of(node)
    node.xpath("child::node()").collect { |n| n.to_s }.join
  end
end
