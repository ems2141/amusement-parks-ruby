require 'spec_helper'
require_relative '../lib/amusement_park'

describe AmusementPark do
  it 'turns an array of hashes to a hash' do
    array = [{
        :id=>546,
        :name=>"Kalahari Resorts",
        :city=>"Wisconsin Dells",
        :state=>"Wisconsin",
        :country=>"United States"
    }]

    expected_hash = AmusementPark.new(array).to_hash

    hash_result = {
        546 => {
            :id=>546,
            :name=>"Kalahari Resorts",
            :city=>"Wisconsin Dells",
            :state=>"Wisconsin",
            :country=>"United States"
        }}

    expect(expected_hash).to eq hash_result
  end
end