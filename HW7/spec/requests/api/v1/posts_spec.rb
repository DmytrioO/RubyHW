require 'swagger_helper'

RSpec.describe 'api/v1/posts', type: :request do

  path '/api/v1/posts' do

    get('list posts') do
      tags 'Posts'
      parameter name: :search, in: :query, type: :string, description: 'Search posts by keywords from title or body'
      parameter name: :status, in: :query, type: :string, description: 'Filter posts by status: published/unpublished'
      parameter name: :author, in: :query, type: :string, description: 'Filter posts by author name'
      parameter name: :tags, in: :query, type: :string, description: 'Filter posts by tags'
      parameter name: :sort, in: :query, type: :string, description: 'Sort posts by titles: asc/desc'
      parameter name: :page, in: :query, type: :integer, description: 'Choose page'

      response(200, 'successful') do
        after do |example|
         example.metadata[:response][:content] = {
           'application/json' => {
             example: JSON.parse(response.body, symbolize_names: true)
           }
         }
        end
        run_test!
      end

      response(500, 'internal server error') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create post') do
      tags 'Posts'
      consumes "application/json"
      parameter name: :post, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          body: { type: :string },
          status: { type: :string, default: 'unpublished' },
          author_id: { type: :integer, default: 1 }
        },
        required: %i[title body status author_id]
      }

      response(201, 'created') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(400, 'bad request') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(422, 'unprocessable entity') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(500, 'internal server error') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/posts/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :integer, description: 'ID of the required post'

    get('show post') do
      tags 'Posts'

      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(404, 'not found') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    patch('update post') do
      tags 'Posts'
      consumes "application/json"
      parameter name: :post, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          body: { type: :string },
          status: { type: :string, default: 'unpublished' },
          author_id: { type: :integer, default: 1 }
        },
        required: %i[title body status author_id]
      }

      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(400, 'bad request') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(404, 'not found') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(422, 'unprocessable entity') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(500, 'internal server error') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    put('update post') do
      consumes "application/json"
      parameter name: :post, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          body: { type: :string },
          status: { type: :string, default: 'unpublished' },
          author_id: { type: :integer, default: 1 }
        },
        required: %i[title body status author_id]
      }
      tags 'Posts'

      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(400, 'bad request') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(404, 'not found') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(422, 'unprocessable entity') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(500, 'internal server error') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('delete post') do
      tags 'Posts'

      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(400, 'bad request') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(404, 'not found') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
