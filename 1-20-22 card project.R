d<-c(1,2,3,4,5,6)
typeof(d)

v<-5
v

char.vec<-c("hello", "world")
char.vec

char.vec<-c("hello", "world", 5)
char.vec
typeof(char.vec) #checking what type of character it is

char.vec2<-c("1", "7", "12")
char.vec2
typeof(char.vec2)

as.numeric(char.vec2) #removes quotes from char.vec2. Not permanent

num.vec<-as.numeric(char.vec2) #permanetly makes char.vec2 a double. Permanetly removes quotes
typeof(num.vec) #checks what type it is

logical.vec<-c(TRUE, FALSE, TRUE)
logical.vec2<-c(F,F,F,T) #Can use T for TRUE and F for false to shorten it
logical.vec
logical.vec2

sum(logical.vec) #F = 0 and T = 1. 1 + 1 = 2

vec<-c(T,F,T,7,14)
vec

vec2<-c(T,F,T,8,14,"coerce")
vec2



d <- c(1,2,3,4,5,6)
matrix(d, nrow = 2)
matrix(d, ncol = 2)
add byrow = T #put this into the end of one of the 2 above functions
d7 <- c(d,7)
d7
matrix(d7, nrow=2)


f<-c("ace","spade","king","spade","queen","spade","jack","spade","ten","spade")
spade.flush<-matrix(f,ncol=2,byrow=T)
spade.flush

f<-c("ace","king","queen","jack","ten")
s<-c("spade","spade","spade","spade","spade")
spade.flush2<-cbind(f,s)
spade.flush2

typeof(spade.flush2)


p<-c(1,2,3,4,5)
l<-c(T,F,F,T,F)

df<-data.frame(f,s,p,l)
str(df)

class(df)
class(spade.flush)

typeof(spade.flush)
typeof(df)

as.matrix()

as.data.frame()


v<-c(13:1)
v
points<-rep(v,4) #rep = repeat function repeating 4 times
points

f2<-c("king","queen","jack","ten","nine","eight","seven","six","five","four","three","two","ace")
face<-rep(f2,4) #repeats f2 4 times
face #running the function


# suits???


cards<-data.frame(face,suit,points)
cards




