#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Persistent
SetCapsLockState, AlwaysOff

f12::Suspend

capslock::Esc
capslock & j::left
capslock & k::down
capslock & l::up
capslock & `;::right
capslock & h::home
capslock & enter::end
capslock & bs::del



q::b
w::l
e::d
r::f
t::w
y::/
u::,
i::o
o::y
p::k

a::r
s::n
d::s
f::t
g::m
h::u
j::a
k::e
l::i
`;::h

b::g
n::`;
m::.
,::q
.::j
/::p




