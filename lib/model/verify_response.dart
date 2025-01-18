class VerifyResponse {
final int? status;
final bool? existingUser;
final String? message;
final String? token;
const VerifyResponse({this.status , this.existingUser , this.message , this.token });
VerifyResponse copyWith({int? status, bool? existingUser, String? message, String? token}){
return VerifyResponse(
            status:status ?? this.status,
existingUser:existingUser ?? this.existingUser,
message:message ?? this.message,
token:token ?? this.token
        );
        }
        
Map<String,Object?> toJson(){
    return {
            'status': status,
'existingUser': existingUser,
'message': message,
'token': token
    };
}

static VerifyResponse fromJson(Map<String , Object?> json){
    return VerifyResponse(
            status:json['status'] == null ? null : json['status'] as int,
existingUser:json['existingUser'] == null ? null : json['existingUser'] as bool,
message:json['message'] == null ? null : json['message'] as String,
token:json['token'] == null ? null : json['token'] as String
    );
}

@override
String toString(){
    return '''VerifyResponse(
                status:$status,
existingUser:$existingUser,
message:$message,
token:$token
    ) ''';
}

@override
bool operator ==(Object other){
    return other is VerifyResponse && 
        other.runtimeType == runtimeType &&
        other.status == status && 
other.existingUser == existingUser && 
other.message == message && 
other.token == token;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                status, 
existingUser, 
message, 
token
    );
}
    
}
      
      
  
     