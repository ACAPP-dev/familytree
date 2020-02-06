User.delete_all
Family.delete_all
Familymember.delete_all
Relationship.delete_all
UserFamily.delete_all

user = User.create(first_name: "Andrew", email: "acapp909@gmail.com", username: "acapp", password: "5555")
family = user.families.build(surname: 'Capp', family_code: 'Capp', password: '1234')
user.save

familymember1 = Familymember.create(first_name: 'Andrew', last_name: 'Capp', gender: 'male', family: family)

familymember2 = Familymember.create(first_name: 'Sharon', last_name: 'Li', gender: 'female', family: family)

familymember1.relationships.build(relation_type: "wife", related_familymember: familymember2)
familymember1.save

familymember2.relationships.build(relation_type: "husband", related_familymember: familymember1)
familymember2.save

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
    a.relationships.build(relation_type: 'father', related_familymember: familymember1)
    #a.save
    a.relationships.build(relation_type: "mother", related_familymember: familymember2)
    a.save
end




