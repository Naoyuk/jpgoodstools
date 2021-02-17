# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'Test' }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { 'foobar' }
    password_confirmation { 'foobar' }
  end
end
