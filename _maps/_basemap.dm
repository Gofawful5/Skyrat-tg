//#define LOWMEMORYMODE //uncomment this to load centcom and runtime station and thats it.

#include "map_files\generic\CentCom.dmm"

#ifndef LOWMEMORYMODE
	#ifdef ALL_MAPS
		#include "map_files\Birdshot\birdshot.dmm"
		#include "map_files\debug\multiz.dmm"
		#include "map_files\debug\runtimestation.dmm"
		#include "map_files\Deltastation\DeltaStation2.dmm"
		#include "map_files\IceBoxStation\IceBoxStation.dmm"
		#include "map_files\MetaStation\MetaStation.dmm"
		#include "map_files\Mining\Lavaland.dmm"
		#include "map_files\NorthStar\north_star.dmm"
		#include "map_files\tramstation\tramstation.dmm"
		// SKYRAT EDIT ADDITON START - Compiling our modular maps too!
		#include "map_files\VoidRaptor\VoidRaptor.dmm"
<<<<<<< HEAD
=======
		#include "map_files\NSVBlueshift\Blueshift.dmm"
		#include "map_files\KiloStation\KiloStation.dmm"
>>>>>>> f23ee25178faa842ef68ab7996cbdff89bde47d2
		// SKYRAT EDIT END

		#ifdef CIBUILDING
			#include "templates.dm"
		#endif
	#endif
#endif
