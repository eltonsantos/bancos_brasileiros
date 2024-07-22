# Bancos Brasileiros

🇧🇷 🏦 📋 Brazilian commercial banks list.

This gem was created to meet a need in the [Brazilian Banks Project](https://guibranco.github.io/BancosBrasileiros/), developed by [Guilherme Branco](https://github.com/guibranco). The project keeps an up-to-date list of banks in various programming languages, and I realized the need to provide support for Rails as well.

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
      @banks = BancosBrasileiros.all_banks
      respond_to do |format|
        format.html
        format.json { render json: @banks }
      end
    end

    def show
      @bank = BancosBrasileiros.find_bank_by_compe(params[:id])
      respond_to do |format|
        if @bank
          format.html
          format.json { render json: @bank }
        else
          format.html { render plain: 'Bank not found.', status: :not_found }
          format.json { render json: { error: 'Bank not found.' }, status: :not_found }
        end
      end
    end

    def by_ispb
      @bank = BancosBrasileiros.find_bank_by_ispb(params[:ispb])
      respond_to do |format|
        if @bank
          format.html { render :show }
          format.json { render json: @bank }
        else
          format.html { render plain: 'Bank not found.', status: :not_found }
          format.json { render json: { error: 'Bank not found.' }, status: :not_found }
        end
      end
    end

    def by_network
      @banks = BancosBrasileiros.find_banks_by_network(params[:network])
      respond_to do |format|
        format.html { render :index }
        format.json { render json: @banks }
      end
    end

    def by_type
      @banks = BancosBrasileiros.find_banks_by_type(params[:type])
      respond_to do |format|
        format.html { render :index }
        format.json { render json: @banks }
      end
    end

    def by_pix_type
      @banks = BancosBrasileiros.find_banks_by_pix_type(params[:pix_type])
      respond_to do |format|
        format.html { render :index }
        format.json { render json: @banks }
      end
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
Create a example of view:

```html
<!-- app/views/banks/index.html.erb -->
<h1>Lista de Bancos Brasileiros</h1>
<table>
  <thead>
    <tr>
      <th>COMPE</th>
      <th>Nome</th>
      <th>Tipo</th>
      <th>Network</th>
      <th>Ações</th>
    </tr>
  </thead>
  <tbody>
    <% @banks.each do |bank| %>
      <tr>
        <td><%= bank['COMPE'] %></td>
        <td><%= bank['LongName'] %></td>
        <td><%= bank['Type'] %></td>
        <td><%= bank['Network'] %></td>
        <td><%= link_to 'Ver detalhes', bank_path(bank['COMPE']) %></td>
      </tr>
    <% end %>
  </tbody>
</table>

<!-- app/views/banks/show.html.erb -->
<h1>Detalhes do Banco</h1>
<p><strong>COMPE:</strong> <%= @bank['COMPE'] %></p>
<p><strong>ISPB:</strong> <%= @bank['ISPB'] %></p>
<p><strong>Nome:</strong> <%= @bank['LongName'] %></p>
<p><strong>Nome Curto:</strong> <%= @bank['ShortName'] %></p>
<p><strong>Tipo:</strong> <%= @bank['Type'] %></p>
<p><strong>Network:</strong> <%= @bank['Network'] %></p>
<p><strong>Pix Type:</strong> <%= @bank['PixType'] %></p>
<p><strong>Produtos:</strong> <%= @bank['Products'].join(', ') %></p>
<p><strong>URL:</strong> <%= link_to @bank['Url'], @bank['Url'] %></p>
<p><strong>Data de Início de Operação:</strong> <%= @bank['DateOperationStarted'] %></p>
<p><strong>Data de Início do Pix:</strong> <%= @bank['DatePixStarted'] %></p>
<p><strong>Data de Registro:</strong> <%= @bank['DateRegistered'] %></p>
<p><strong>Data de Atualização:</strong> <%= @bank['DateUpdated'] %></p>

<%= link_to 'Voltar', banks_path %>
```

## Requirements

- Ruby >= 2.6.0 (recommended 2.7+)  
- Rails >= 6.0 (compatible up to Rails 7)

## Contributing to Bancos Brasileiros

Fork, fix, then send a pull request. Bug reports and pull requests are welcome on GitHub at **https://github.com/eltonsantos/bancos_brasileiros**.

## License

This gem is available as open-source under the terms of The MIT License (MIT).

Copyright (c) 2024 **Elton Santos**. See **MIT-LICENSE** for further details.