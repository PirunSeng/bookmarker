class FinderGrid
  include Datagrid

  scope do
    Finder.all
  end

  filter(:name, :string) { |value, scope| scope.name_like(value) }
  filter(:reference, :string) { |value, scope| scope.reference_like(value) }
  filter(:description, :string) { |value, scope| scope.description_like(value) }

  column(:name)
  column(:reference)
  column(:description)
end
