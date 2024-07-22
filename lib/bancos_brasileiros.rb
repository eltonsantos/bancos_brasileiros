# frozen_string_literal: true

require 'json'
require_relative "bancos_brasileiros/version"

module BancosBrasileiros
  class << self
    def load_data
      file_path = File.expand_path('../../data/bancos.json', __FILE__)
      JSON.parse(File.read(file_path))
    end

    def all_banks
      load_data
    end

    def find_bank_by_codigo_compe(compe)
      all_banks.find { |bank| bank["COMPE"] == compe }
    end

    def find_bank_by_ispb(ispb)
      all_banks.find { |bank| bank["ISPB"] == ispb }
    end

    def find_banks_by_network(network)
      all_banks.select { |bank| bank["Network"] == network }
    end

    def find_banks_by_type(bank_type)
      all_banks.select { |bank| bank["Type"] == bank_type }
    end

    def find_banks_by_pix_type(pix_type)
      all_banks.select { |bank| bank["PixType"] == pix_type }
    end
  end
end
