/datum/vote/restart
	name = "restart"
	choices = list("Restart Round","Continue Playing")

/datum/vote/restart/can_run(mob/creator, automatic)
	// TODO(rufus): fix the logic for other votes
	if(!automatic && !config.vote.allow_vote_restart && !is_admin(creator))
		return FALSE // Admins and autovotes bypass the config setting.
	return ..()

/datum/vote/restart/handle_default_votes()
	var/non_voters = ..()
	choices["Continue Playing"] += non_voters

/datum/vote/restart/report_result()
	if(..())
		return 1
	if(result[1] == "Restart Round")
		SSvote.restart_world()
