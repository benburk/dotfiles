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



q::w
w::g
e::d
r::f
t::b
y::q
u::l
i::u
o::o
p::y

a::r
s::s
d::t
f::h
g::k
h::j
j::n
k::e
l::a
`;::i
'::`;

z::x
x::c
c::m
v::p
b::v
n::z
m::,
,::.
.::'
/::/




