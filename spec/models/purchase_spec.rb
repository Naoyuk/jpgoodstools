# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @supplier = Supplier.create(name: 'test', representative: 'test', email: 'test@example.com',
                                address: '1234 Abc Street')
    @purchase = @supplier.purchases.build
  end

  it 'is valid with supplier_id, item_name, amount, price, cad, jpy, payment_method, note, order_date, payment_date, and exchangerate' do
    @purchase.item_name = 'test'
    @purchase.amount = 5
    @purchase.price = 15
    @purchase.cad = 15
    @purchase.jpy = 1200
    @purchase.payment_method = 'test'
    @purchase.note = 'test'
    @purchase.order_date = Date.today
    @purchase.payment_date = Date.today
    @purchase.exchangerate = 1.23
    expect(@purchase).to be_valid
  end

  it 'is invalid without item_name' do
    @purchase.item_name = nil
    @purchase.valid?
    expect(@purchase.errors[:item_name]).to include("can't be blank")
  end

  it 'is invalid without amount' do
    @purchase.amount = nil
    @purchase.valid?
    expect(@purchase.errors[:amount]).to include("can't be blank")
  end

  it 'is invalid without price' do
    @purchase.price = nil
    @purchase.valid?
    expect(@purchase.errors[:price]).to include("can't be blank")
  end

  it 'is invalid without payment_method' do
    @purchase.payment_method = nil
    @purchase.valid?
    expect(@purchase.errors[:payment_method]).to include("can't be blank")
  end

  it 'is invalid without order_date' do
    @purchase.order_date = nil
    @purchase.valid?
    expect(@purchase.errors[:order_date]).to include("can't be blank")
  end
end
