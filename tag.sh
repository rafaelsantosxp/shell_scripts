#!/bin/bash
LAST_COMMIT=`git log --date-order | grep -oh 'hotfix\|feature\|release'|  head --lines 1`
LAST_TAG=`git tag -l | sort -V | tail --lines=1`
IFS='.' read -a vers <<< "$LAST_TAG"

MAJ=${vers[0]}
MIN=${vers[1]}
BUG=${vers[2]}

if [[ $LAST_COMMIT == hotfix ]]
then
    echo "o ultimo commit veio de um $LAST_COMMIT"
    echo "$LAST_TAG"
    ((BUG+=1))
    echo "Bug Version incrementada"
elif [[ $LAST_COMMIT == feature ]]
then
    echo "o ultimo commit veio de um $LAST_COMMIT"
    echo "$LAST_TAG"
    ((MIN+=1))
    BUG=0
    echo "Minor Version incrementada"
elif [[ $LAST_COMMIT == release ]]
then
    echo "o ultimo commit veio de um $LAST_COMMIT"
    echo "$LAST_TAG"
    ((MAJ+=1))
    MIN=0
    BUG=0
    echo "Major Version incrementada"
else
    echo "nao foi possivel verificar o ultimo commmit na Master!"
fi

if [[ -z "$MAJ" ]]
then
    MAJ=0
else
    echo "Tag MAJOR encontrada"
fi

if [[ -z "$MIN" ]]
then
    MIN=0
else
    echo "Tag MINOR encontrada"
fi

if [[ -z "$BUG" ]]
then
    BUG=first_tag
else
    echo "Tag BUG encontrada"
fi

NEWTAG="$MAJ.$MIN.$BUG"
echo "adicionando Tag: $NEWTAG";
echo "export NEWTAG=$NEWTAG" >> tag_env.sh
echo "export LASTTAG=$LAST_TAG" >> tag_env.sh
