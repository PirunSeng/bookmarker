class FinderGrid
  include Datagrid

  scope do
    Finder.all
  end

  filter(:name, :string, header: 'Title') { |value, scope| scope.name_like(value) }
  filter(:reference, :string) { |value, scope| scope.reference_like(value) }
  filter(:description, :string) { |value, scope| scope.description_like(value) }

  column(:name, header: 'Title')
  column(:reference, html: true) do |object|
    link_to object.reference, object.reference, target: :_blank
  end
  column(:reference, html: false)
  column(:description)
end
