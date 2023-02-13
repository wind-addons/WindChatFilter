local W, F, L, P = unpack(select(2, ...))

P.groupInviteGuard = {
    enabled = true,
    onlyFriendsOrGuildMembers = false,
    smartMode = true,
    displayMessageAfterRejecting = true,
}