mob
	var
		vida = 100
		ataque = 10
		defesa = 10
		nocauteado = 0
		atacando = 0
		tempo_ataque = 15
mob
	proc
		ReceberDano(mob/atacante)

			if(!atacante)
				return 0

			if(src.nocauteado || src.vida <= 0)
				return 0

			// Calcula a redução de dano pela defesa
			var/reducao = 0

			if((src.defesa + atacante.ataque) > 0)
				reducao = src.defesa / (src.defesa + atacante.ataque)

			// Calcula o dano final
			var/dano_final = round(5 + atacante.ataque * (1 - reducao))

			if(dano_final < 1)
				dano_final = 1

			// Aplica o dano
			src.vida -= dano_final

			src << "Você recebeu [dano_final] de dano!"

			if(atacante)
				atacante << "Você causou [dano_final] de dano em [src]!"

			// Verifica se o personagem foi derrotado
			if(src.vida <= 0)
				src.vida = 0
				src.KnockOut(atacante)

			return 1


		Atacar()

			if(src.atacando || src.vida <= 0 || src.nocauteado)
				return

			// Procura um alvo no quadrado à frente
			var/turf/T = get_step(src, src.dir)

			if(!T)
				return

			var/mob/alvo = null

			for(var/mob/M in T)
				if(M != src && !M.nocauteado && M.vida > 0)
					alvo = M
					break

			if(!alvo)
				src << "Não existe nenhum adversário à sua frente."
				return

			// Inicia o ataque
			src.atacando = 1

			alvo.ReceberDano(src)

			// Controla o intervalo entre ataques
			spawn(src.tempo_ataque)
				if(src)
					src.atacando = 0


mob
	verb
		Bater()
			set name = "Ataque Básico"
			set category = "Combate"

			src.Atacar()

mob/proc
	KnockOut(atom/source)

		if(src.nocauteado)
			return

		src.nocauteado = 1

		src << "Você foi nocauteado!"

		if(source)
			source << "[src] foi nocauteado!"