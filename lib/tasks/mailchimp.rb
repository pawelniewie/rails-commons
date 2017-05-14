namespace :commons do
  namespace :mailchimp do

    desc 'List all mailing lists with ids'
    task :lists => :environment do
      gibbon = Gibbon::Request.new

      lists = gibbon.lists.retrieve(params: { 'fields': 'lists.id,lists.name' }).body.fetch('lists', [])
      lists.each do |list|
        puts "#{list['id']} #{list['name']}"
      end
    end

    desc 'List all interests for each mailing list'
    task :interests => :environment do
      gibbon = Gibbon::Request.new

      lists = gibbon.lists.retrieve(params: { 'fields': 'lists.id,lists.name' }).body.fetch('lists', []).map do |list|
        list_id = list['id']

        categories = gibbon.lists(list_id).interest_categories.retrieve.body.fetch('categories', []).map do |category|

          interests = gibbon
            .lists(list_id)
            .interest_categories(category['id']).interests.retrieve.body.fetch('interests', []).map do |interest|

            OpenStruct.new(id: interest['id'], name: interest['name'])
          end

          OpenStruct.new(id: category['id'], name: category['title'], interests: interests)
        end

        OpenStruct.new(id: list_id, name: list['name'], categories: categories)
      end

      lists.each do |list|
        puts "#{list.id} #{list.name}"
        list.categories.each do |category|
          puts "  #{category.id} #{category.name}"
          category.interests.each do |interest|
            puts "    #{interest.id} #{interest.name}"
          end
        end
      end
    end

  end

end
