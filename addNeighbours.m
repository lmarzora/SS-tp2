function neighbours = addNeighbours(cell1, cell2, rc, L, periodic, particles, neighbours, sameCell)
	if(sameCell)
		for i = 1:length(cell1)
			for j = i + 1 : length(cell1)
				neighbours = addNeighbour(cell1(i),cell1(j),rc,L,periodic,particles,neighbours);
			endfor
		endfor
	else
		for p = cell1
			for q = cell2
				neighbours = addNeighbour(p,q,rc,L,periodic,particles,neighbours);
			endfor
		endfor
	endif
endfunction

function neighbours = addNeighbour(p,q,rc,L,periodic,particles,neighbours)		
	dist_borde = getDistBorde(p,q,particles,false,L);

		if(dist_borde <= rc)
			neighbours = concatNeighbours(neighbours,p,q);

		else 
			if periodic
				dist_borde = getDistBorde(p,q,particles,true,L);
				if(dist_borde <= rc)
					neighbours = concatNeighbours(neighbours,p,q);
				endif
			endif
		endif
endfunction

function neighbours = concatNeighbours(neighbours,p,q)
	neighbours(p) = {[neighbours{p},q]};
	neighbours(q) = {[neighbours{q},p]};
endfunction

function dist_borde = getDistBorde(p,q,particles, periodic, L)

	X = 1;
	Y = 2;
	R = 3;

	[xPos_p, xPos_q] = getParticleVal(p,q,particles,X);
	[yPos_p, yPos_q] = getParticleVal(p,q,particles,Y);
	[r_p, r_q] = getParticleVal(p,q,particles,R);



		dist_x = abs(xPos_p - xPos_q);
		dist_y = abs(yPos_p - yPos_q);


	if(periodic)
		dist_x = L - dist_x;
		dist_y = L - dist_y;
	endif


	dist_center = sqrt(dist_x^2 + dist_y^2);
	dist_borde = dist_center - (r_p + r_q);

endfunction


function [pos_p,pos_q] = getParticleVal(p,q,particles,xy)
	pos_p = particles(p,xy);
	pos_q = particles(q,xy);
endfunction



