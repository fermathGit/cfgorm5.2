# -*- coding: cp936 -*-
import pysvn
import os
import sys

def get_revision_number_of_directory( svn, localPath ):
    head_rev = pysvn.Revision( pysvn.opt_revision_kind.head )
    info = svn.info2( localPath, revision = head_rev, recurse = False )
    info = info[0][1]
    return ( info.rev.number, info.last_changed_author )

if __name__ == '__main__':
    svn = pysvn.Client()
    
    info = get_revision_number_of_directory( svn, "../.././" )
    print( "Root current SVN working base version: " + str( info[0] ) + " commited by " + info[1] )
    info = get_revision_number_of_directory( svn, "../../Client" )
    print( "Client current SVN working base version: " + str( info[0] ) + " commited by " + info[1] )
    info = get_revision_number_of_directory( svn, "../../server" )
    print( "Server current SVN working base version: " + str( info[0] ) + " commited by " + info[1] )
    
    entry = svn.info( "../.././" )
    print( "Root current SVN working copy version: " + str( entry.commit_revision.number ) + " commited by " + entry.commit_author )
    entry = svn.info( "../../Client" )
    print( "Client current SVN working copy version: " + str( entry.commit_revision.number ) + " commited by " + entry.commit_author )
    entry = svn.info( "../../server" )
    print( "Server current SVN working copy version: " + str( entry.commit_revision.number ) + " commited by " + entry.commit_author )
    




