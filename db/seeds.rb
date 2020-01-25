Family.delete_all
Familymember.delete_all
Relationship.delete_all
FamilymemberRelationship.delete_all

family = Family.create(surname: 'Capp')

relationship1 = Relationship.create(relation_type: 'spouse')

familymembers = [
    {first_name: 'Andrew', last_name: 'Capp', gender: 'male'},
    {first_name: 'Sharon', last_name: 'Li', gender: 'female'}
]

familymembers.each do |member| 
    a = Familymember.new(member)
    a.families = family
    b = FamilymemberRelationship.new
    b.familymember = a
    b.relationship = relationship1
    b.save
    a.save
end






