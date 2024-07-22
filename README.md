# Bancos Brasileiros

🇧🇷 🏦 📋 Brazilian commercial banks list

## Installation

Add gem in your Gemfile:

```ruby
gem 'bancos_brasileiros'
```
and run **bundle install**

## Usage

Example of how to use the `bancos_brasileiros` in a rails project:

Create a controller:

```ruby
  # app/controllers/banks_controller.rb
  class BanksController < ApplicationController
    def index
      render json: BancosBrasileiros.all_banks
    end

    def show
      bank = BancosBrasileiros.find_bank_by_compe(params[:id])
      if bank
        render json: bank
      else
        render json: { error: 'Bank not found.' }, status: :not_found
      end
    end

    def by_ispb
      bank = BancosBrasileiros.find_bank_by_ispb(params[:ispb])
      if bank
        render json: bank
      else
        render json: { error: 'Bank not found.' }, status: :not_found
      end
    end

    def by_network
      banks = BancosBrasileiros.find_banks_by_network(params[:network])
      render json: bancos
    end

    def by_type
      banks = BancosBrasileiros.find_banks_by_type(params[:type])
      render json: banks
    end

    def by_pix_type
      banks = BancosBrasileiros.find_banks_by_pix_type(params[:pix_type])
      render json: banks
    end
  end
```
Create routes:

```ruby
  # config/routes.rb
  Rails.application.routes.draw do
    resources :banks, only: [:index, :show] do
      collection do
        get 'by_ispb/:ispb', to: 'banks#by_ispb'
        get 'by_network/:network', to: 'banks#by_network'
        get 'by_type/:type', to: 'banks#by_type'
        get 'by_pix_type/:pix_type', to: 'banks#by_pix_type'
      end
    end
  end
```

## Requirements

- Ruby >= 2.6.0 (recommended 2.7+)  
- Rails >= 6.0 (compatible up to Rails 7)

## Contributing to Bancos Brasileiros

Fork, fix, then send a pull request. Bug reports and pull requests are welcome on GitHub at **https://github.com/eltonsantos/bancos_brasileiros**.

## License

This gem is available as open-source under the terms of The MIT License (MIT).

Copyright (c) 2024 **Elton Santos**. See **MIT-LICENSE** for further details.