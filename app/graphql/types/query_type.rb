# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    field :blogs, [Types::BlogType], null: true, description: "Fetches all the blogs"

    def blogs
      Blog.all
    end

    field :blog, Types::BlogType, null: false, description: "Fetch blog for some id" do
      argument :id, ID, required: true
    end

    def blog(id:)
      Blog.find(id)
    end

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end
  end
end
