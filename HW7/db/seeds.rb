# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Author.create(name: 'Dmytro', lastname: 'Onyshchenko', email: 'odm2003@meta.ua')
Author.create(name: 'Anonym', lastname: 'Anonymovich', email: 'anonym@ruby.rb')
Post.create(title: 'First post', body: "Hi, I'm first post!", author_id: 1)
Post.create(title: 'Test post', body: "Hi, I'm a test post!", author_id: 1, status: 1)
Post.create(title: 'Post for edit', body: "Hi, I'm post for edit!", author_id: 1, status: :published)
Comment.create(body: 'First comment', author_id: 2, post_id: 1)
Comment.create(body: 'Second comment', author_id: 2, post_id: 1, status: :published)
Comment.create(body: 'Third comment', author_id: 1, post_id: 3, status: :published)