# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
App.where(id: 1, title: 'Pierpont Global', logo: 'https://asset-images-ppg.s3.amazonaws.com/global.svg', location: 'https://app.pierpontglobal.com', description: 'Participate in the car auctions from Manheim').first_or_create
App.where(id: 2, title: 'Pierpont Logistics', logo: 'https://asset-images-ppg.s3.amazonaws.com/logistics.png', location: 'https://app.pierpontlogistics.com', description: 'Manage the trasport of loads in the US').first_or_create
App.where(id: 3, title: 'Pierpont Investors', logo: 'https://asset-images-ppg.s3.amazonaws.com/investors.svg', location: 'https://investors.pierpontglobal.com', description: 'Review your investments from your personal platform').first_or_create
