##############################################################################
##
#W  folding_plan.gd          SimplicialSurfaces           Markus Baumeister
##
##
#Y  Copyright (C) 2016-2017, Markus Baumeister, Lehrstuhl B für Mathematik,
#Y  RWTH Aachen
##
##  This file is free software, see license information at the end.
##
##  This file contains the declaration part for the folding plans of the 
##	SimplicialSurfaces package. A folding plan consists of an identification
##	and two oriented faces belongig to the identified faces.
##
##


DeclareCategory( "IsFoldingPlan",
					IsComponentObjectRep and IsAttributeStoringRep );


##
##	Define a new family for folding plans. The family
##	defines a necessary condition that has to be fulfilled for objects to be 
##	equal to each other. The argument IsFoldingPlan 
##	guarantees that only objects that lie in this category can be part of the 
##	family.
##
FoldingPlanFamily := NewFamily("FoldingPlanFamily",  IsObject, IsFoldingPlan);



#############################################################################
##
##
#!  @Section Constructors for folding plans
#!
#!
#!

#!	@Description
#!	Return a folding plan based on an identification and a list of two 
#!	oriented faces (integers).
#!	The NC-version doesn't check whether the list actually consists of exactly
#!	two integers.
#!	@Arguments a simplicial surface identification, a tuple of integers
#!	@Returns a folding plan
DeclareOperation( "FoldingPlanByIdentification", 
					[IsSimplicialSurfaceIdentification, IsList] );
DeclareOperation( "FoldingPlanByIdentificationNC", 
					[IsSimplicialSurfaceIdentification, IsList] );

#!	@Description
#!	Return a folding plan based on four maps. The first three define the
#!	identification, the last one is the oriented face map.
#!
#!	The NC-version doesn't check whether the number of elements in these 
#!	maps match (3 vertices, 3 edges, 1 face, 1 oriented face).
#!
#!	@Arguments four bijective maps: for vertices, edges, faces and oriented
#!		faces
#!	@Returns a folding plan
DeclareOperation( "FoldingPlanByMaps", [IsMapping and IsBijective, IsMapping 
	and IsBijective, IsMapping and IsBijective, IsMapping and IsBijective]);
DeclareOperation( "FoldingPlanByMapsNC", [IsMapping and IsBijective, IsMapping 
	and IsBijective, IsMapping and IsBijective, IsMapping and IsBijective]);

#!	@Description
#!	Return a folding plan that is constructed from four lists. The vertex-list 
#!	has the form [[p_1,q_1],[p_2,q_2],[p_3,q_3]] and corresponds to the map 
#!	p_i -> q_i. Analogously for the other three lists.
#!
#!	The NC-version does not check if the lists fulfill this format or if the
#!	number of elements match or if the resulting maps are bijective.
#!
#!	@Arguments three lists of tuples of positive integers, one list of tuples
#!		of integers
#!	@Returns a folding plan
DeclareOperation( "FoldingPlanByLists", [IsList,IsList,IsList,IsList]);
DeclareOperation( "FoldingPlanByListsNC", [IsList,IsList,IsList,IsList]);



#############################################################################
##
##
#!  @Section Attributes and properties of folding plans
#!
#!

#!	@Description
#!	Return the oriented face map.
#!	@Arguments a folding plan
#!	@Returns a bijective map
DeclareAttribute( "OrientedFaceMapAttributeOfFoldingPlan", IsFoldingPlan );
DeclareOperation( "OrientedFaceMap", [IsFoldingPlan] );

#!	@Description
#!	Return the identification a folding plan is based on.
#!	@Arguments a folding plan
#!	@Returns a simplicial surface identification
DeclareAttribute( "IdentificationAttributeOfFoldingPlan", IsFoldingPlan );
DeclareOperation( "Identification", [IsFoldingPlan] );





#############################################################################
##
##
#!  @Section Functions for folding plans
#!
#!
#!

#!	@Description
#!	Return the vertex map.
#!	@Arguments a folding plan
#!	@Returns a bijective map
DeclareOperation( "VertexMap", [IsFoldingPlan] );


#!	@Description
#!	Return the edge map.
#!	@Arguments a folding plan
#!	@Returns a bijective map
DeclareOperation( "EdgeMap", [IsFoldingPlan] );


#!	@Description
#!	Return the face map.
#!	@Arguments a folding plan
#!	@Returns a bijective map
DeclareOperation( "FaceMap", [IsFoldingPlan] );

#TODO

#!	@Description
#!	Return if the given simplicial surface identification is well-defined
#!	with respect to the given simplicial surface.
#!	This method checks if the maps of the identification can be applied to
#!	the vertices, edges and faces of the simplicial surface. It also
#!	checks whether the maps are compatible with each other, i.e. if they
#!	commute with the incidence relation of the simplicial surface.
#!	@Arguments a simplicial surface, a simplicial surface identification
#!	@Returns true or false
DeclareOperation( "IsWellDefinedIdentification", 
	[IsSimplicialSurface, IsSimplicialSurfaceIdentification] );


#!	@Description
#!	Return if the given simplicial surface identification is constant on the
#!	intersection for the given coloured simplicial surface.
#!	TODO explain what this means
#!	@Arguments a coloured simplicial surface, a simplicial surface 
#!	identification
#!	@Returns true or false
DeclareOperation( "IsConstantOnIntersection", 
	[IsColouredSimplicialSurface, IsSimplicialSurfaceIdentification] );


#!	@Description
#!	Return if the given simplicial surface identification can be applied to
#!	the given coloured simplicial surface and result in another
#!	coloured simplicial surface. To be more precise we check the
#!	property of corollary 2.37 in my master thesis.
#!	@Arguments a coloured simplicial surface, a simplicial surface 
#!	identification
#!	@Returns true or false
DeclareOperation( "IsApplicableExtension", 
	[IsColouredSimplicialSurface, IsSimplicialSurfaceIdentification] );

#!	@Description
#!	Extend the equivalence relation of the coloured simplicial surface
#!	with a simplicial surface identification.
#!
#!	The NC-version does not run the test IsApplicableExtension.
#!
#!	@Arguments a coloured simplicial surface, a simplicial surface
#!		identification
#!	@Returns a coloured simplicial surface
DeclareOperation( "ExtendByIdentification",
	[IsColouredSimplicialSurface, IsSimplicialSurfaceIdentification] );
DeclareOperation( "ExtendByIdentificationNC",
	[IsColouredSimplicialSurface, IsSimplicialSurfaceIdentification] );


#
###  This program is free software: you can redistribute it and/or modify
###  it under the terms of the GNU General Public License as published by
###  the Free Software Foundation, either version 3 of the License, or
###  (at your option) any later version.
###
###  This program is distributed in the hope that it will be useful,
###  but WITHOUT ANY WARRANTY; without even the implied warranty of
###  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
###  GNU General Public License for more details.
###
###  You should have received a copy of the GNU General Public License
###  along with this program.  If not, see <http://www.gnu.org/licenses/>.
###
