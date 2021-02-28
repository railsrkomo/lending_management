
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  users = User.create([
		{ name: '山田　太郎', email: "taro@example.com", password: "taropass" },
		{ name: '鈴木　一郎', email: "ichi@example.com", password: "ichipass"  },
		{ name: 'ドリーム', email: "dream@example.com", password: "dreampass"  },
		{ name: '高橋　花子', email: "hana@example.com", password: "hanapass"  },
		 ])
  users.each {|u|
	  #  u.friends << User.where.not(email: u.email)
		User.where.not(email: u.email).each {|f|
			u.fellows << f.fellows.new(friend_email: f.email, reason_of: "友だち", relation_since: Time.now)
		}
		puts u.name
	}
