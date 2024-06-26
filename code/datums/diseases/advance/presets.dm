// Cold
/datum/disease/advance/cold
	copy_type = /datum/disease/advance

/datum/disease/advance/cold/New(make_typecache = TRUE)
	name = "Cold"
	symptoms = list(new/datum/symptom/sneeze)
	..()

// Flu
/datum/disease/advance/flu
	copy_type = /datum/disease/advance

/datum/disease/advance/flu/New(make_typecache = TRUE)
	name = "Flu"
	symptoms = list(new/datum/symptom/cough)
	..()

//Randomly generated Disease, for virus crates and events
/datum/disease/advance/random
	name = "Experimental Disease"
	copy_type = /datum/disease/advance

/datum/disease/advance/random/New(make_typecache = TRUE, max_symptoms, max_level = 8)
	if(!max_symptoms)
		max_symptoms = rand(1, VIRUS_SYMPTOM_LIMIT)
	var/list/datum/symptom/possible_symptoms = list()
	for(var/symptom in subtypesof(/datum/symptom))
		var/datum/symptom/S = symptom
		if(initial(S.level) > max_level)
			continue
		if(initial(S.level) <= 0) //unobtainable symptoms
			continue
		possible_symptoms += S
	for(var/i in 1 to max_symptoms)
		var/datum/symptom/chosen_symptom = pick_n_take(possible_symptoms)
		if(chosen_symptom)
			var/datum/symptom/S = new chosen_symptom
			symptoms += S //Avoiding the randomness
			S.OnAdd(src) //Activating symptoms added

	name = "Sample #[rand(1,10000)]"
	..()


// Weight gain - GS13
/datum/disease/advance/weight_gain
	copy_type = /datum/disease/advance

/datum/disease/advance/weight_gain/New(make_typecache = TRUE)
	name = "Weight Gain"
	symptoms = list(new/datum/symptom/weight_gain)
	..()

/obj/item/reagent_containers/glass/bottle/weight_gain
	name = "Weight gain virus bottle"
	desc = "A small bottle. Contains weight gain virus in synthblood medium."
	spawned_disease = /datum/disease/advance/weight_gain


// Berry virus - GS13
/datum/disease/advance/berry_virus
	copy_type = /datum/disease/advance

/datum/disease/advance/berry_virus/New(make_typecache = TRUE)
	name = "Blueberry Virus"
	symptoms = list(new/datum/symptom/berry)
	..()

/obj/item/reagent_containers/glass/bottle/berry
	name = "Blueberry virus bottle"
	desc = "A small bottle. Contains blueberry virus in synthblood medium."
	spawned_disease = /datum/disease/advance/berry_virus
