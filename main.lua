local Firebase
do
	Firebase = setmetatable({}, {
		__tostring = function()
			return "Firebase"
		end,
	})
	Firebase.__index = Firebase
	function Firebase.new(...)
		local self = setmetatable({}, Firebase)
		return self:constructor(...) or self
	end
	function Firebase:constructor(config, name)
		self.config = config
		self.endpoint = "https://" .. (config.projectId .. ".firebase.io/")
		if name ~= "" and name then
			self.appName = name
		else
			self.appName = "[DEFAULT]"
		end
	end
end
local Firestore
do
	local super = Firebase
	Firestore = setmetatable({}, {
		__tostring = function()
			return "Firestore"
		end,
		__index = super,
	})
	Firestore.__index = Firestore
	function Firestore.new(...)
		local self = setmetatable({}, Firestore)
		return self:constructor(...) or self
	end
	function Firestore:constructor(...)
		super.constructor(self, ...)
	end
	function Firestore:getCollection(collection, callback)
		if not (collection ~= "" and collection) then
			return {
				error = true,
				message = "No Collection was found",
			}
		end
		local responseObject = {
            data = "",
            
        }
        Http:Post(self.endpoint .. ("/" .. (collection .. ".json")), "", function(data, error, errorMessage)
        
        end)
	end
end
return nil


local firebaseConfig = {
	apiKey = "",
	authDomain = "",
	databaseURL = "",
	projectId = "",
	storageBucket = "",
	messagingSenderId = "",
	appId = "",
	measurementId = "",
}
