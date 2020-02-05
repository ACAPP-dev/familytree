User.delete_all
Family.delete_all
Familymember.delete_all
Relationship.delete_all
UserFamily.delete_all

user = User.create(username: "acapp", password: "5555")
family = Family.create(surname: 'Capp')
user.families << family
user.save
family.users << user
family.save

familymember1 = Familymember.create(first_name: 'Andrew', last_name: 'Capp', gender: 'male', family: family)

familymember2 = Familymember.create(first_name: 'Sharon', last_name: 'Li', gender: 'female', family: family)

rel1 = familymember1.relationships.build(relation_type: "wife")
rel1.related_familymember = familymember2
rel1.save
familymember1.save

rel2 = familymember2.relationships.build(relation_type: "husband")
rel2.related_familymember = familymember1
rel2.save
familymember2.save

#familymember1.relationships.first.related_familymember = familymember2
#familymember1.save

#familymember2.relationships.first.related_familymember = familymember1
#familymember2.save

familymembers3 = [
                    {first_name: 'Amber', last_name: 'Burns', gender: 'female'},
                    {first_name: 'Ashleigh', last_name: 'Simon', gender: 'female'},
                    {first_name: 'Jessica', last_name: 'Zhang', gender: 'female'},
                    {first_name: 'Jolynn', last_name: 'Zhang', gender: 'female'}
                ]

#create family members that are daughters and save relationships

familymembers3.each do |member| 
    a = Familymember.new(member)
    a.family = family

    rel3 = Relationship.create(relation_type: 'father')
    rel3.related_familymember = Familymember.find_by(first_name: 'Andrew')
    rel3.save

    rel4 = Relationship.create(relation_type: "mother")
    rel4.related_familymember = Familymember.find_by(first_name: 'Sharon')
    rel4.save

    a.relationships << rel3
    a.relationships << rel4
    a.save
end




