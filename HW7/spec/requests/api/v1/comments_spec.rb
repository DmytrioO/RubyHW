require 'swagger_helper'

RSpec.describe 'api/v1/comments', type: :request do

  path '/api/v1/posts/{post_id}/comments' do
    # You'll want to customize the parameter types...
    parameter name: 'post_id', in: :path, type: :integer, default: 1, description: 'Post ID'

    get('list comments') do
      parameter name: :status, in: :query, type: :string, description: 'Filter comments by status: published/unpublished'
      tags 'Comments'
      response(200, 'successful') do
        #let(:post_id) { '123' }

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

    post('create comment') do
      tags 'Comments'
      consumes "application/json"
      parameter name: :post, in: :body, schema: {
        type: :object,
        properties: {
          body: { type: :string },
          status: { type: :string },
          author_id: { type: :integer, default: 1 },
          post_id: { type: :integer, default: 1 }
        },
        required: %i[body status author_id post_id]
      }
      response(200, 'successful') do
        #let(:post_id) { '123' }

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

  path '/api/v1/posts/{post_id}/comments/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'post_id', in: :path, type: :integer, default: 1, description: 'Post ID'
    parameter name: 'id', in: :path, type: :integer, description: 'ID of the required comment'

    get('show comment') do
      tags 'Comments'
      response(200, 'successful') do
        #let(:post_id) { '123' }
        #let(:id) { '123' }

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

    patch('update comment') do
      tags 'Comments'
      consumes "application/json"
      parameter name: :post, in: :body, schema: {
        type: :object,
        properties: {
          body: { type: :string },
          status: { type: :string },
          author_id: { type: :integer, default: 1 },
          post_id: { type: :integer, default: 1 }
        },
        required: %i[body status author_id post_id]
      }
      response(200, 'successful') do
        #let(:post_id) { '123' }
        #let(:id) { '123' }

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

    put('update comment') do
      tags 'Comments'
      consumes "application/json"
      parameter name: :post, in: :body, schema: {
        type: :object,
        properties: {
          body: { type: :string },
          status: { type: :string },
          author_id: { type: :integer, default: 1 },
          post_id: { type: :integer, default: 1 }
        },
        required: %i[body status author_id post_id]
      }
      response(200, 'successful') do
        #let(:post_id) { '123' }
        #let(:id) { '123' }

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

    delete('delete comment') do
      tags 'Comments'
      response(200, 'successful') do
        #let(:post_id) { '123' }
        #let(:id) { '123' }

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
