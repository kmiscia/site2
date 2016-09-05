class UserSerializer < ApplicationSerializer
  self.root = false

  attributes :id, :username
end