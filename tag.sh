#!/bin/bash
LAST_COMMIT=`git log $(git tag -l | sort -V | tail --lines=1) | grep -oh 'hotfix\|feature\|release' | tail --lines 1`
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
    echo "Minor Version incrementada"
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

NEWTAG="$MAJ.$MIN.$BUG"
echo "adicionando Tag: $NEWTAG";
echo "export NEWTAG=$NEWTAG" >> tag_env.sh
