function [grid, L, N] = createGrid(L,N, rc,M, radios)
	densidad = N/(L^2);
	rmax = max(radios);

	#L/M > rc + 2rmax	
	#calcular M
		if(L/M <= rc + 2*rmax)
			printf("M no cumple con la condición");
			exit(1);
		endif	
	grid = cell(M);

endfunction
