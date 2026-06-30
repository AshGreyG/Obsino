def hello_type : String := "This is a string, "
def hello_no_type := "this is also a string"

#eval String.append hello_type hello_no_type

def NewStrType : Type := String
def new_str_instance : NewStrType := "Test for new str type"
#eval new_str_instance
