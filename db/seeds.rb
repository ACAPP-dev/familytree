Family.delete_all
Familymember.delete_all
Relationship.delete_all
Familyjoin.delete_all

family = Family.create(surname: 'Capp')

rel1 = Relationship.create(relation_type: 'spouse', description: 'Andrew-Sharon')
rel2 = Relationship.create(relation_type: 'parent_child', description: 'Andrew and Sharon family')

familymembers1 = [
    {first_name: 'Andrew', last_name: 'Capp', gender: 'male'},
    {first_name: 'Sharon', last_name: 'Li', gender: 'female'}
]

familymembers1.each do |member| 
    a = Familymember.new(member)
    a.families = family
    #binding.pry
    a.relationships << rel1
    a.relationships << rel2
    a.save
end

familymembers2 = [
    {first_name: 'Amber', last_name: 'Burns', gender: 'female'},
    {first_name: 'Ashleigh', last_name: 'Simon', gender: 'female'},
    {first_name: 'Jessica', last_name: 'Zhang', gender: 'female'},
    {first_name: 'Jolynn', last_name: 'Zhang', gender: 'female'}
]

familymembers2.each do |member| 
    a = Familymember.new(member)
    a.families = family
    a.relationships << rel2
    a.save
end




