User.delete_all
Family.delete_all
Familymember.delete_all
Relationship.delete_all
UserFamily.delete_all

user1 = User.create(first_name: "Andrew", email: "acapp909@gmail.com", username: "acapp", password: "5555")
user2 = User.create(first_name: "Sharon", email: "sharon@gmail.com", username: "sharon", password: "1234")
user3 = User.create(first_name: "Amber", email: "amber@gmail.com", username: "amber", password: "1111")

family1 = user1.families.build(surname: 'Capp', family_code: 'Capp', password: '5555')
family2 = user1.families.build(surname: 'Li', family_code: 'Li', password: '1234')
family3 = user3.families.build(surname: 'Burns', family_code: 'Burns', password: '1111')

user1.save

user2.families << family1
user2.save

user3.save

#family1 Capp familymembers

cappfamilymembers = [
                        {first_name: 'Andrew', last_name: 'Capp', gender: 'male'},
                        {first_name: 'Sharon', last_name: 'Li', gender: 'female'},
                        {first_name: 'Amber', last_name: 'Burns', gender: 'female'},
                        {first_name: 'Ashleigh', last_name: 'Simon', gender: 'female'},
                        {first_name: 'Jessica', last_name: 'Zhang', gender: 'female'},
                        {first_name: 'Jolynn', last_name: 'Zhang', gender: 'female'},
                        {first_name: 'Joyce', last_name: 'Durbin', gender: 'female'},
                        {first_name: 'Cliff', last_name: 'Capp', gender: 'male'},
                        {first_name: 'Gladys', last_name: 'Capp', gender: 'female'},
                        {first_name: 'Aaron', last_name: 'Capp', gender: 'male'},
                        {first_name: 'Velma', last_name: 'Durbin', gender: 'female'},
                        {first_name: 'Jim', last_name: 'Durbin', gender: 'male'}
                    ]

cappfamilymembers.each do |member| 
    a = Familymember.new(member)
    a.family = family1
    a.save
end



cappfamilyrelationships =   [
                                {first_name: 'Andrew', relation_type: 'wife', related_familymember_first_name: 'Sharon'},
                                {first_name: 'Andrew', relation_type: 'father', related_familymember_first_name: 'Joyce'},
                                {first_name: 'Andrew', relation_type: 'mother', related_familymember_first_name: 'Cliff'},
                                {first_name: 'Sharon', relation_type: 'husband', related_familymember_first_name: 'Andrew'},
                                {first_name: 'Amber', relation_type: 'father', related_familymember_first_name: 'Andrew'},
                                {first_name: 'Amber', relation_type: 'mother', related_familymember_first_name: 'Sharon'},
                                {first_name: 'Ashleigh', relation_type: 'father', related_familymember_first_name: 'Andrew'},
                                {first_name: 'Ashleigh', relation_type: 'mother', related_familymember_first_name: 'Sharon'},
                                {first_name: 'Jessica', relation_type: 'father', related_familymember_first_name: 'Andrew'},
                                {first_name: 'Jessica', relation_type: 'mother', related_familymember_first_name: 'Sharon'},
                                {first_name: 'Jolynn', relation_type: 'father', related_familymember_first_name: 'Andrew'},
                                {first_name: 'Jolynn', relation_type: 'mother', related_familymember_first_name: 'Sharon'},
                                {first_name: 'Joyce', relation_type: 'husband', related_familymember_first_name: 'Cliff'},
                                {first_name: 'Joyce', relation_type: 'father', related_familymember_first_name: 'Jim'},
                                {first_name: 'Joyce', relation_type: 'mother', related_familymember_first_name: 'Velma'},
                                {first_name: 'Cliff', relation_type: 'wife', related_familymember_first_name: 'Joyce'},
                                {first_name: 'Cliff', relation_type: 'father', related_familymember_first_name: 'Aaron'},
                                {first_name: 'Cliff', relation_type: 'mother', related_familymember_first_name: 'Gladys'},
                                {first_name: 'Gladys', relation_type: 'husband', related_familymember_first_name: 'Aaron'},
                                {first_name: 'Aaron', relation_type: 'wife', related_familymember_first_name: 'Gladys'},
                                {first_name: 'Velma', relation_type: 'husband', related_familymember_first_name: 'Jim'},
                                {first_name: 'Jim', relation_type: 'wife', related_familymember_first_name: 'Velma'},

                                















                            ]

Familymember.all.where(family: family1).each do |each_member|
    cappfamilyrelationships.each do |relationship|
        if relationship[:first_name] == each_member.first_name
            related_familymember_instance = Familymember.find_by(first_name: relationship[:related_familymember_first_name], family: family1)
            each_member.relationships.build(relation_type: relationship[:relation_type], related_familymember: related_familymember_instance)
            each_member.save
        end


    end

end

#binding.pry



# new section

#familymember1.relationships.build(relation_type: "wife", related_familymember: familymember2)
#familymember1.save

#familymember2.relationships.build(relation_type: "husband", related_familymember: familymember1)
#familymember2.save

#familymembers3 = [
 #                   {first_name: 'Amber', last_name: 'Burns', gender: 'female'},
  #                  {first_name: 'Ashleigh', last_name: 'Simon', gender: 'female'},
   #                 {first_name: 'Jessica', last_name: 'Zhang', gender: 'female'},
    #                {first_name: 'Jolynn', last_name: 'Zhang', gender: 'female'}
     #           ]

#create family members that are daughters and save relationships

#familymembers3.each do |member| 
 #   a = Familymember.new(member)
  #  a.family = family
   # a.relationships.build(relation_type: 'father', related_familymember: familymember1)
    #a.save
    #a.relationships.build(relation_type: "mother", related_familymember: familymember2)
    #a.save
#end
