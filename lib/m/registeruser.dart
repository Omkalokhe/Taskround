class RegisterUserPayload {
final String? name;
final String? email;
final String? phone;
final String? refferalCode;
const RegisterUserPayload({this.name , this.email , this.phone , this.refferalCode });
RegisterUserPayload copyWith({String? name, String? email, String? phone, String? refferalCode}){
return RegisterUserPayload(
            name:name ?? this.name,
email:email ?? this.email,
phone:phone ?? this.phone,
refferalCode:refferalCode ?? this.refferalCode
        );
        }
        
Map<String,Object?> toJson(){
    return {
            'name': name,
'email': email,
'phone': phone,
'refferal_Code': refferalCode
    };
}

static RegisterUserPayload fromJson(Map<String , Object?> json){
    return RegisterUserPayload(
            name:json['name'] == null ? null : json['name'] as String,
email:json['email'] == null ? null : json['email'] as String,
phone:json['phone'] == null ? null : json['phone'] as String,
refferalCode:json['refferal_Code'] == null ? null : json['refferal_Code'] as String
    );
}

@override
String toString(){
    return '''RegisterUserPayload(
                name:$name,
email:$email,
phone:$phone,
refferalCode:$refferalCode
    ) ''';
}

@override
bool operator ==(Object other){
    return other is RegisterUserPayload && 
        other.runtimeType == runtimeType &&
        other.name == name && 
other.email == email && 
other.phone == phone && 
other.refferalCode == refferalCode;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                name, 
email, 
phone, 
refferalCode
    );
}
    
}
      
      
  
     