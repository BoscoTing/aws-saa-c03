require 'mongo'
require 'pry'


def insert_one collection
    doc = {
    name: 'Steve',
    hobbies: [ 'hiking', 'tennis', 'fly fishing' ],
    siblings: {
        brothers: 0,
        sisters: 1
    }
    }
    result = collection.insert_one(doc)
    puts result.n # returns 1, because one document was inserted
    binding.pry
end


def insert_many collection
    docs = [ 
        { 
            _id: 1, 
            name: 'Steve', 
            hobbies: [ 'hiking', 'tennis', 'fly fishing' ],
            siblings: { brothers: 0, sisters: 1 } 
        },
        {
            _id: 2, 
            name: 'Sally',
            hobbies: ['skiing', 'stamp collecting' ],
            siblings: { brothers: 1, sisters: 0 } 
        }
    ]
    result = collection.insert_many(docs)
    puts result.inserted_count # returns 2 because two documents were inserted
end


def query collection
    collection.find.each do |document|
        puts document
    end
end


client = Mongo::Client.new(
    ["mydocumentdb-660513648685.ap-northeast-1.docdb-elastic.amazonaws.com:27017"],
    user: 'docadmin',
    password: 'InsertPassword',
    database: 'test',
    retry_writes: false,
    ssl: true    
)

db = client.database
collection = db[:people]
query(collection)
