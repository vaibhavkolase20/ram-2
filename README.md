# ram-2



k8s security

RBAC
Documentation used.
https://docs.bitnami.com/tutorials/configure-rbac-in-your-kubernetes-cluster/
https://www.baeldung.com/openssl-self-signed-cert


role--> conbination of rules
rules--> principle + action + resources(k8s objects)


authentication & authorization


authentication using iD+password


authorisation --> permissions --> using roles


key + certificate sign request (csr) + cert


~/.minikube -- path of CA.key ca.crt -- certificate authority to validate user with key and certificate




create key for user authentication

openssl genrsa -out cbz.key 2048    ===this is key for generate key



now create cetificate request for key

openssl req -key cbz.key -new -out cbz.csr  ==== this is key for create certificate
--------------------------------------------
for certification it need some information

# country name=IN
# state=MH
# locality=nagpur
# organization=cloudblitz
# unit name= dev
# common name=suraj
# enter
# enter

to validate this certificate request
self sign cetificate
--------------------
openssl x509 --help

openssl x509 -req -in cbz.csr -out cbz.crt -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -days 365 -CAcreateserial  == this is show your certificate create or not
----------------------------------------------
it gives signature ok
------------------
here certificate created


now we have cbz.key, cbz.crt, cbz.csr

now configure user


user configuration present in .kube/config


here we have to create profile for user




#check how many user are present

kubectl config get-users 
------------------------------
#user profile
-----------
kubectl config get-contexts
-------------------------
#set credentials for user 

kubectl config set-credentials suraj --client-certificate=cbz.crt --client-key=cbz.key
------------------
#create user profile
-------------------
kubectl config get-users            #check how many user are present
kubectl config get-contexts         #check user porfiles

#assign cluster to user

kubectl config set-context suraj --cluster=minikube --user=suraj --namespace=default

kubectl --context=suraj get pods #check user suraj is able to access pods

kubectl config use-context suraj    # switch user to suraj 
-------------------------------------



no permission for user
now set role and attach it using rolebinding to user



create role

apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: myrole
rules: 
 - apiGroups: [""]
   resources: ["pods"]
   verbs: ["get", "watch", "create", "list"]


kubectl edit role myrole  #we edit role after applying 




create rolebinding

apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding 
metadata: 
  name: mybinding
subject:		       #define user details 
- kind: user		   #user
  name: suraj		   #user name
  apiGroup: "rbac.authorization.k8s.io/v1"

RoleRef:
 kind: Role
 name: myrole
 apiGroup: "rbac.authorization.k8s.io/v1"
-----------------------------------------------

kubectl get roles
kubectl get rolebinding.





now check user is able to access pods or not


kubectl config current-context


kubectl config use-context suraj


now user suraj can access pods.   
