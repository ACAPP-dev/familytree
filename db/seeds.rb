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
                        {first_name: 'Jim', last_name: 'Durbin', gender: 'male'},
                        {first_name: 'GGMA Anger', last_name: 'Anger', gender: 'female'},
                        {first_name: 'GGPA Anger', last_name: 'Anger', gender: 'male'},
                        {first_name: 'GGMA Durbin', last_name: 'Durbin', gender: 'female'},
                        {first_name: 'GGPA Durbin', last_name: 'Durbin', gender: 'male'},
                        {first_name: 'GGMA', last_name: 'GMA Side', gender: 'female'},
                        {first_name: 'GGPA', last_name: 'GMA Side', gender: 'male'},
                        {first_name: 'GGMA Capp', last_name: 'Capp', gender: 'female'},
                        {first_name: 'GGPA Capp', last_name: 'Capp', gender: 'male'}
                    ]

cappfamilymembers.each do |member| 
    a = Familymember.new(member)
    a.family = family1
    a.save
end

cappfamilyrelationships =   [
                                {first_name: 'Andrew', relation_type: 'wife', related_familymember_first_name: 'Sharon'},
                                {first_name: 'Andrew', relation_type: 'father', related_familymember_first_name: 'Cliff'},
                                {first_name: 'Andrew', relation_type: 'mother', related_familymember_first_name: 'Joyce'},
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
                                {first_name: 'Gladys', relation_type: 'father', related_familymember_first_name: 'GGPA'},
                                {first_name: 'Gladys', relation_type: 'mother', related_familymember_first_name: 'GGMA'},
                                {first_name: 'Aaron', relation_type: 'wife', related_familymember_first_name: 'Gladys'},
                                {first_name: 'Aaron', relation_type: 'father', related_familymember_first_name: 'GGPA Capp'},
                                {first_name: 'Aaron', relation_type: 'mother', related_familymember_first_name: 'GGMA Capp'},
                                {first_name: 'Velma', relation_type: 'husband', related_familymember_first_name: 'Jim'},
                                {first_name: 'Velma', relation_type: 'father', related_familymember_first_name: 'GGPA Anger'},
                                {first_name: 'Velma', relation_type: 'mother', related_familymember_first_name: 'GGMA Anger'},
                                {first_name: 'Jim', relation_type: 'wife', related_familymember_first_name: 'Velma'},
                                {first_name: 'Jim', relation_type: 'father', related_familymember_first_name: 'GGPA Durbin'},
                                {first_name: 'Jim', relation_type: 'mother', related_familymember_first_name: 'GGMA Durbin'},

                                {first_name: 'GGMA', relation_type: 'husband', related_familymember_first_name: 'GGPA'},
                                {first_name: 'GGPA', relation_type: 'wife', related_familymember_first_name: 'GGMA'},
                                {first_name: 'GGMA Capp', relation_type: 'husband', related_familymember_first_name: 'GGPA Capp'},
                                {first_name: 'GGPA Capp', relation_type: 'wife', related_familymember_first_name: 'GGMA Capp'},
                                {first_name: 'GGMA Anger', relation_type: 'husband', related_familymember_first_name: 'GGPA Anger'},
                                {first_name: 'GGPA Anger', relation_type: 'wife', related_familymember_first_name: 'GGMA Anger'},
                                {first_name: 'GGMA Durbin', relation_type: 'husband', related_familymember_first_name: 'GGPA Durbin'},
                                {first_name: 'GGPA Durbin', relation_type: 'wife', related_familymember_first_name: 'GGMA Durbin'}
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

#Sharon Family data

lifamilymembers = [
                        {first_name: 'Andrew', last_name: 'Capp', gender: 'male'},
                        {first_name: 'Sharon', last_name: 'Li', gender: 'female'},
                        {first_name: 'Amber', last_name: 'Burns', gender: 'female'},
                        {first_name: 'Ashleigh', last_name: 'Simon', gender: 'female'},
                        {first_name: 'Jessica', last_name: 'Zhang', gender: 'female'},
                        {first_name: 'Jolynn', last_name: 'Zhang', gender: 'female'},
                        {first_name: 'Bihua', last_name: 'Ye', gender: 'female'},
                        {first_name: 'Dad', last_name: 'of Sharon', gender: 'male'},
                        {first_name: 'Paternal GMA', last_name: 'of Sharon', gender: 'female'},
                        {first_name: 'Paternal GPA', last_name: 'of Sharon', gender: 'male'},
                        {first_name: 'Maternal GMA', last_name: 'of Sharon', gender: 'female'},
                        {first_name: 'Maternal GPA', last_name: 'of Sharon', gender: 'male'}
                    ]

lifamilymembers.each do |member| 
    a = Familymember.new(member)
    a.family = family2
    a.save
end



lifamilyrelationships =   [
                                {first_name: 'Andrew', relation_type: 'wife', related_familymember_first_name: 'Sharon'},
                                {first_name: 'Sharon', relation_type: 'father', related_familymember_first_name: 'Dad'},
                                {first_name: 'Sharon', relation_type: 'mother', related_familymember_first_name: 'Bihua'},
                                {first_name: 'Sharon', relation_type: 'husband', related_familymember_first_name: 'Andrew'},
                                {first_name: 'Amber', relation_type: 'father', related_familymember_first_name: 'Andrew'},
                                {first_name: 'Amber', relation_type: 'mother', related_familymember_first_name: 'Sharon'},
                                {first_name: 'Ashleigh', relation_type: 'father', related_familymember_first_name: 'Andrew'},
                                {first_name: 'Ashleigh', relation_type: 'mother', related_familymember_first_name: 'Sharon'},
                                {first_name: 'Jessica', relation_type: 'father', related_familymember_first_name: 'Andrew'},
                                {first_name: 'Jessica', relation_type: 'mother', related_familymember_first_name: 'Sharon'},
                                {first_name: 'Jolynn', relation_type: 'father', related_familymember_first_name: 'Andrew'},
                                {first_name: 'Jolynn', relation_type: 'mother', related_familymember_first_name: 'Sharon'},
                                {first_name: 'Bihua', relation_type: 'husband', related_familymember_first_name: 'Dad'},
                                {first_name: 'Bihua', relation_type: 'father', related_familymember_first_name: 'Maternal GPA'},
                                {first_name: 'Bihua', relation_type: 'mother', related_familymember_first_name: 'Maternal GMA'},
                                {first_name: 'Dad', relation_type: 'wife', related_familymember_first_name: 'Bihua'},
                                {first_name: 'Dad', relation_type: 'father', related_familymember_first_name: 'Paternal GPA'},
                                {first_name: 'Dad', relation_type: 'mother', related_familymember_first_name: 'Paternal GMA'},
                                {first_name: 'Paternal GMA', relation_type: 'husband', related_familymember_first_name: 'Paternal GPA'},
                                {first_name: 'Paternal GPA', relation_type: 'wife', related_familymember_first_name: 'Paternal GMA'},
                                {first_name: 'Maternal GMA', relation_type: 'husband', related_familymember_first_name: 'Maternal GPA'},
                                {first_name: 'Maternal GPA', relation_type: 'wife', related_familymember_first_name: 'Maternal GMA'},
                            ]

Familymember.all.where(family: family2).each do |each_member|
    lifamilyrelationships.each do |relationship|
        if relationship[:first_name] == each_member.first_name
            related_familymember_instance = Familymember.find_by(first_name: relationship[:related_familymember_first_name], family: family2)
            each_member.relationships.build(relation_type: relationship[:relation_type], related_familymember: related_familymember_instance)
            #binding.pry
            each_member.save
        end
    end
end


#Burns Family data

burnsfamilymembers = [
                        {first_name: 'Brandon', last_name: 'Burns', gender: 'male'},
                        {first_name: 'Amber', last_name: 'Capp', gender: 'female'},
                        {first_name: 'Charleigh', last_name: 'Burns', gender: 'female'},
                        {first_name: 'Ryan', last_name: 'Burns', gender: 'male'},
                        {first_name: 'Desiree', last_name: 'Burns', gender: 'female'},
                        {first_name: 'Tom', last_name: 'Burns', gender: 'male'},
                        {first_name: 'Paternal GMA', last_name: 'of Brandon', gender: 'female'},
                        {first_name: 'Paternal GPA', last_name: 'of Brandon', gender: 'male'},
                        {first_name: 'Maternal GMA', last_name: 'of Brandon', gender: 'female'},
                        {first_name: 'Maternal GPA', last_name: 'of Brandon', gender: 'male'},
                    ]

burnsfamilymembers.each do |member| 
    a = Familymember.new(member)
    a.family = family3
    a.save
end



burnsfamilyrelationships =   [
                                {first_name: 'Brandon', relation_type: 'wife', related_familymember_first_name: 'Amber'},
                                {first_name: 'Brandon', relation_type: 'father', related_familymember_first_name: 'Tom'},
                                {first_name: 'Brandon', relation_type: 'mother', related_familymember_first_name: 'Desiree'},
                                {first_name: 'Amber', relation_type: 'husband', related_familymember_first_name: 'Brandon'},
                                {first_name: 'Charleigh', relation_type: 'father', related_familymember_first_name: 'Brandon'},
                                {first_name: 'Charleigh', relation_type: 'mother', related_familymember_first_name: 'Amber'},
                                {first_name: 'Ryan', relation_type: 'father', related_familymember_first_name: 'Tom'},
                                {first_name: 'Ryan', relation_type: 'mother', related_familymember_first_name: 'Desiree'},
                                {first_name: 'Desiree', relation_type: 'husband', related_familymember_first_name: 'Tom'},
                                {first_name: 'Desiree', relation_type: 'father', related_familymember_first_name: 'Maternal GPA'},
                                {first_name: 'Desiree', relation_type: 'mother', related_familymember_first_name: 'Maternal GMA'},
                                {first_name: 'Tom', relation_type: 'wife', related_familymember_first_name: 'Desiree'},
                                {first_name: 'Tom', relation_type: 'father', related_familymember_first_name: 'Paternal GPA'},
                                {first_name: 'Tom', relation_type: 'mother', related_familymember_first_name: 'Paternal GMA'},
                                {first_name: 'Paternal GMA', relation_type: 'husband', related_familymember_first_name: 'Paternal GPA'},
                                {first_name: 'Paternal GPA', relation_type: 'wife', related_familymember_first_name: 'Paternal GMA'},
                                {first_name: 'Maternal GMA', relation_type: 'husband', related_familymember_first_name: 'Maternal GPA'},
                                {first_name: 'Maternal GPA', relation_type: 'wife', related_familymember_first_name: 'Maternal GMA'},
                            ]

Familymember.all.where(family: family3).each do |each_member|
    burnsfamilyrelationships.each do |relationship|
        if relationship[:first_name] == each_member.first_name
            related_familymember_instance = Familymember.find_by(first_name: relationship[:related_familymember_first_name], family: family3)
            each_member.relationships.build(relation_type: relationship[:relation_type], related_familymember: related_familymember_instance)
            #binding.pry
            each_member.save
        end
    end
end
