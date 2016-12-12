/// debug_password()
var tern_pass = get_string("Type the ternary password", make_password());

if check_password(tern_pass) {
    apply_password(tern_pass);
    playSFX(sfxMenuSelect);
}
else {
    playSFX(sfxError);
    print("ERROR: Invalid password.");
}
