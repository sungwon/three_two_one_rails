require 'rails_helper'

RSpec.describe "Rodauth Routes", type: :request do
    path '/login' do
        post 'Logs in a user' do
            tags 'Rodauth'
            consumes 'application/json'
            parameter name: :user, in: :body, schema: {
                type: :object,
                properties: {
                    email: { type: :string },
                    password: { type: :string },
                },
                required: ['email', 'password']
            }
            response '200', 'user logged in' do
                let(:user) { { email: 'example', password: 'password' } }
                run_test!
            end
        end
    end

    path '/create-account' do
        post 'Creates an account' do
            tags 'Rodauth'
            consumes 'application/json'
            parameter name: :user, in: :body, schema: {
                type: :object,
                properties: {
                    email: { type: :string },
                    password: { type: :string },
                    'password-confirm': { type: :string },
                },
                required: ['email', 'password', 'password-confirm']
            }
            response '200', 'account created' do
                let(:user) { { email: 'example@example.com', password: 'password', 'password-confirm': 'password' } }
                run_test!
            end
        end
    end

    path '/verify-account' do
        post 'Verifies an account' do
            tags 'Rodauth'
            consumes 'application/json'
            parameter name: :user, in: :body, schema: {
                type: :object,
                properties: {
                    key: { type: :string },
                },
                required: ['key']
            }
            response '200', 'account verified' do
                let(:user) { { key: 'example_key' } }
                run_test!
            end
        end
    end

    path '/verify-account-resend' do
        post 'Resends account verification email' do
            tags 'Rodauth'
            consumes 'application/json'
            parameter name: :user, in: :body, schema: {
                type: :object,
                properties: {
                    email: { type: :string },
                },
                required: ['email']
            }
            response '200', 'account verification email resent' do
                let(:user) { { email: 'example@example.com' } }
                run_test!
            end
        end
    end

    path '/logout' do
        post 'Logs out a user' do
            tags 'Rodauth'
            response '200', 'user logged out' do
                run_test!
            end
        end
    end

    # path '/remember' do
    #     post 'Sends a password reminder email' do
    #         tags 'Rodauth'
    #         consumes 'application/json'
    #         parameter name: :user, in: :body, schema: {
    #             type: :object,
    #             properties: {
    #                 email: { type: :string },
    #             },
    #             required: ['email']
    #         }
    #         response '200', 'password reminder email sent' do
    #             let(:user) { { email: 'example@example.com' } }
    #             run_test!
    #         end
    #     end
    # end

    path '/reset-password-request' do
        post 'Sends a password reset email' do
            tags 'Rodauth'
            consumes 'application/json'
            parameter name: :user, in: :body, schema: {
                type: :object,
                properties: {
                    email: { type: :string },
                },
                required: ['email']
            }
            response '200', 'password reset email sent' do
                let(:user) { { email: 'example@example.com' } }
                run_test!
            end
        end
    end

    path '/reset-password' do
        post 'Resets a user password' do
            tags 'Rodauth'
            consumes 'application/json'
            parameter name: :user, in: :body, schema: {
                type: :object,
                properties: {
                    key: { type: :string },
                    password: { type: :string },
                },
                required: ['key', 'password']
            }
            response '200', 'password reset' do
                let(:user) { { key: 'key', password: 'new-password' } }
                run_test!
            end
        end
    end

    path '/change-password' do
        post 'Changes a user password' do
            tags 'Rodauth'
            consumes 'application/json'
            parameter name: :user, in: :body, schema: {
                type: :object,
                properties: {
                    password: { type: :string },
                    'new-password': { type: :string },
                },
                required: ['new-password']
            }
            response '200', 'password changed' do
                let(:user) { { 'new-password': 'new-password' } }
                run_test!
            end
        end
    end

    path '/change-login' do
        post 'Changes a user login' do
            tags 'Rodauth'
            consumes 'application/json'
            parameter name: :user, in: :body, schema: {
                type: :object,
                properties: {
                    email: { type: :string },
                },
                required: ['email']
            }
            response '200', 'login changed' do
                let(:user) { { email: 'new_username' } }
                run_test!
            end
        end
    end

    path '/verify-login-change' do
        post 'Verifies a login change' do
            tags 'Rodauth'
            consumes 'application/json'
            parameter name: :user, in: :body, schema: {
                type: :object,
                properties: {
                    key: { type: :string },
                },
                required: ['key']
            }
            response '200', 'login change verified' do
                let(:user) { { 'key': 'example_token' } }
                run_test!
            end
        end
    end

    path '/close-account' do
        post 'Closes a user account' do
            tags 'Rodauth'
            consumes 'application/json'
            parameter name: :user, in: :body, schema: {
                type: :object,
                properties: {
                    password: { type: :string },
                },
                required: ['password']
            }
            response '200', 'account closed' do
                let(:user) { { password: 'password' } }
                run_test!
            end
        end
    end
end
