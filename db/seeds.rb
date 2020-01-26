Family.delete_all
Familymember.delete_all
Relationship.delete_all
#Familyjoin.delete_all

family = Family.create(surname: 'Capp')

#rel1 = Relationship.create(relation_type: 'spouse', description: 'Andrew-Sharon')
#rel2 = Relationship.create(relation_type: 'child', description: 'Andrew and Sharon family')
#rel3 = Relationship.create(relation_type: 'parent', description: 'parents Andrew and Sharon')

familymembers1 = [
    {first_name: 'Andrew', last_name: 'Capp', gender: 'male'},
    {first_name: 'Sharon', last_name: 'Li', gender: 'female'}
]
#create family members that are spouses
familymembers1.each do |member| 
    a = Familymember.new(member)
    a.family = family
    a.save
end

#manually create and link relationships for family members that are spouses

    a = Familymember.find_by(first_name: "Andrew")
    #binding.pry
    rel = Relationship.create(relation_type: 'spouse', description: 'Sharon is my spouse')
    rel.related_familymember = Familymember.find_by(first_name: "Sharon")
    rel.save
    a.relationships << rel
    #a.relationships << rel3
    a.save

    b = Familymember.find_by(first_name: "Sharon")
    rel4 = Relationship.create(relation_type: 'spouse', description: 'Andrew is my spouse')
    rel4.related_familymember = Familymember.find_by(first_name: "Andrew")
    rel4.save
    b.relationships << rel4
    b.save

familymembers2 = [
    {first_name: 'Amber', last_name: 'Burns', gender: 'female'},
    {first_name: 'Ashleigh', last_name: 'Simon', gender: 'female'},
    {first_name: 'Jessica', last_name: 'Zhang', gender: 'female'},
    {first_name: 'Jolynn', last_name: 'Zhang', gender: 'female'}
]

#create family members that are children and save relationships
familymembers2.each do |member| 
    a = Familymember.new(member)
    a.family = family
    rel2 = Relationship.create(relation_type: 'child', description: 'Andrew and Sharon family')
    rel2.related_familymember = Familymember.find_by(first_name: 'Andrew')
    rel2.save
    a.relationships << rel2
    a.save
end




