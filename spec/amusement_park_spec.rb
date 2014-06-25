require 'spec_helper'
require_relative '../lib/indexer'

describe Indexer do
  it 'turns an single element array of hashes to a hash' do
    array = [{
        :id=>546,
        :name=>"Kalahari Resorts",
        :city=>"Wisconsin Dells",
        :state=>"Wisconsin",
        :country=>"United States"
    }]

    expected_hash = Indexer.new(array).to_hash("id")

    hash_result = {
        546 => [{
            :id=>546,
            :name=>"Kalahari Resorts",
            :city=>"Wisconsin Dells",
            :state=>"Wisconsin",
            :country=>"United States"
        }]}

    expect(expected_hash).to eq hash_result
  end

  it 'can turn an array of multiple hashes to a single hash' do
    pending
    array = [
        {
            :id=>546,
            :name=>"Kalahari Resorts",
            :city=>"Wisconsin Dells",
            :state=>"Wisconsin",
            :country=>"United States"
        },
        {
            :id=>547,
            :name=>"Little Amerricka",
            :city=>"Marshall",
            :state=>"Wisconsin",
            :country=>"United States"
        }
    ]

    expected_hash = Indexer.new(array).to_hash("id")

    hash_result = {
        546 => {
            :id=>546,
            :name=>"Kalahari Resorts",
            :city=>"Wisconsin Dells",
            :state=>"Wisconsin",
            :country=>"United States"
        },
        547 => {
            :id=>547,
            :name=>"Little Amerricka",
            :city=>"Marshall",
            :state=>"Wisconsin",
            :country=>"United States"
        }
    }

    expect(expected_hash).to eq hash_result
  end

  it 'can index by country' do
    array = [
        {
            :id=>546,
            :name=>"Kalahari Resorts",
            :city=>"Wisconsin Dells",
            :state=>"Wisconsin",
            :country=>"United States"
        },
        {
            :id=>547,
            :name=>"Little Amerricka",
            :city=>"Marshall",
            :state=>"Wisconsin",
            :country=>"United States"
        },
        {
            :id=>2,
            :name=>"Calaway Park",
            :city=>"Calgary",
            :state=>"Alberta",
            :country=>"Canada"
        }
    ]

    expected_hash = Indexer.new(array).to_hash("country")

    hash_result = {
        "Canada" => [
            {
                :id=>2,
                :name=>"Calaway Park",
                :city=>"Calgary",
                :state=>"Alberta",
                :country=>"Canada"
            }
        ],
        "United States" => [
            {
                :id=>546,
                :name=>"Kalahari Resorts",
                :city=>"Wisconsin Dells",
                :state=>"Wisconsin",
                :country=>"United States"
            },
            {
                :id=>547,
                :name=>"Little Amerricka",
                :city=>"Marshall",
                :state=>"Wisconsin",
                :country=>"United States"
            }
        ]
    }
    expect(expected_hash).to eq hash_result
  end

  it 'can index by more than one variable' do
    array = [
        {
            :id=>3,
            :name=>"Galaxyland",
            :city=>"Edmonton",
            :state=>"Alberta",
            :country=>"Canada"
        },
        {
            :id=>4,
            :name=>"Heratage Park",
            :city=>"Calgary",
            :state=>"Alberta",
            :country=>"Canada"
        },
        {
            :id=>6,
            :name=>"Playland (Vancouver)",
            :city=>"Vancouver",
            :state=>"British Columbia",
            :country=>"Canada"
        },
        {
            :id=>8,
            :name=>"Crystal Palace Amusement Park",
            :city=>"Dieppe",
            :state=>"New Brunswick",
            :country=>"Canada"
        }
    ]

    expected_hash = Indexer.new(array).index_hash("state", "country")

    hash_result = {
        "Alberta, Canada" => [
            {
                :id => 3,
                :name => "Galaxyland",
                :city => "Edmonton",
                :state => "Alberta",
                :country => "Canada"
            },
            {
                :id => 4,
                :name => "Heratage Park",
                :city => "Calgary",
                :state => "Alberta",
                :country => "Canada"
            },
        ],
        "British Columbia, Canada" => [
            {
                :id => 6,
                :name => "Playland (Vancouver)",
                :city => "Vancouver",
                :state => "British Columbia",
                :country => "Canada"
            },
        ],
        "New Brunswick, Canada" => [
            {
                :id => 8,
                :name => "Crystal Palace Amusement Park",
                :city => "Dieppe",
                :state => "New Brunswick",
                :country => "Canada"
            }
        ]
    }

    expect(expected_hash).to eq hash_result
  end
end