require 'require_relative'
require_relative './extractor.rb'

# Sample extractors used at https://github.com/henriquebecker91/masters, where
# this code had its beggining. This file contains the code used to extract info
# from the different outputs generated by UKP solving programs.

class SampleExtractor < Extractor
  def names
    ['first word', 'second word'] 
  end

  def extract_from_lines(lines)
    lines[0].split().take(2)
  end
end

class UKP5Extractor < Extractor
  def names
    ['internal time', 'external time', 'external memory', 'opt']
  end

  def extract_from_lines(lines)
    ['Seconds', 'ext_time', 'ext_mem', 'opt'].map do | label |
      Extractor.get_field(lines, label)
    end
  end
end

class PyaExtractor< Extractor
  def names
    ['internal time', 'external time', 'external memory', 'opt']
  end

  def extract_from_lines(lines)
    values = ['Total Time ', 'ext_time', 'ext_mem'].map do | label |
      Extractor.get_field(lines, label)
    end
    opt_key = '#The optimal value for the given capacity'
    values << Extractor.get_hfield(lines, opt_key)
  end
end

