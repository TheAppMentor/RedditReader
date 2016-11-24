//
//  RedAPIReader.swift
//  RedditReader
//
//  Created by Moorthy, Prashanth on 11/18/16.
//  Copyright © 2016 Prashanth Moorthy. All rights reserved.
//

import Foundation


enum RedditAPIHandler : String{
//    case hot = "listings/hot"
//    case random = "listings/random"
//    case top = "listings/top"
//    case controversial = "listings/controversial"
//    case new = "listings/new"

    case none_api_comment
    case none_api_friend
    case none_api_needs_captcha
    case none_api_unfriend
    case none_api_v1_scopes
    case account_api_v1_me_prefs
    case creddits_api_v1_gold_gild_fullname
    case creddits_api_v1_gold_give_username
    case edit_api_del
    case edit_api_editusertext
    case edit_api_live_thread_delete_update
    case edit_api_live_thread_strike_update
    case edit_api_sendreplies
    case flair_api_flairselector
    case flair_api_selectflair
    case flair_api_setflairenabled
    case history_user_username_comments
    case history_user_username_downvoted
    case history_user_username_gilded
    case history_user_username_hidden
    case history_user_username_overview
    case history_user_username_saved
    case history_user_username_submitted
    case history_user_username_upvoted
    case history_user_username_where
    case identity_api_v1_me
    case identity_api_v1_me_prefs
    case identity_api_v1_me_trophies
    case livemanage_api_live_thread_accept_contributor_invite
    case livemanage_api_live_thread_close_thread
    case livemanage_api_live_thread_edit
    case livemanage_api_live_thread_invite_contributor
    case livemanage_api_live_thread_leave_contributor
    case livemanage_api_live_thread_rm_contributor
    case livemanage_api_live_thread_rm_contributor_invite
    case livemanage_api_live_thread_set_contributor_permissions
    case mysubredditsmysubreddits
    case mysubreddits_api_v1_me_friends_username
    case mysubreddits_api_v1_me_karma
    case mysubreddits_subreddits_mine_contributor
    case mysubreddits_subreddits_mine_moderator
    case mysubreddits_subreddits_mine_subscriber
    case mysubreddits_subreddits_mine_where
    case mysubredditsprivatemessages
    case mysubreddits_api_block
    case mysubreddits_api_compose
    case mysubreddits_api_del_msg
    case mysubreddits_api_read_all_messages
    case mysubreddits_api_read_message
    case mysubreddits_api_unblock_subreddit
    case mysubreddits_api_unread_message
    case mysubreddits_message_inbox
    case mysubreddits_message_sent
    case mysubreddits_message_unread
    case mysubreddits_message_where
    case read_about_banned
    case read_about_contributors
    case read_about_edited
    case read_about_moderators
    case read_about_modqueue
    case read_about_muted
    case read_about_reports
    case read_about_spam
    case read_about_unmoderated
    case read_about_wikibanned
    case read_about_wikicontributors
    case read_about_location
    case read_about_where
    case read_api_filter_filterpath
    case read_api_filter_filterpath_r_srname
    case read_api_info
    case read_api_live_happening_now
    case read_api_morechildren
    case read_api_multi_mine
    case read_api_multi_user_username
    case read_api_multi_multipath
    case read_api_multi_multipath_description
    case read_api_multi_multipath_r_srname
    case read_api_recommend_sr_srnames
    case read_api_search_reddit_names
    case read_api_subreddits_by_topic
    case read_api_v1_me_blocked
    case read_api_v1_me_friends
    case read_api_v1_user_username_trophies
    case read_by_id_names
    case read_comments_article
    case read_controversial
    case read_duplicates_article
    case read_hot
    case read_live_thread
    case read_live_thread_about
    case read_live_thread_contributors
    case read_live_thread_discussions
    case read_new
    case read_prefs_blocked
    case read_prefs_friends
    case read_prefs_where
    case read_r_subreddit_about
    case read_random
    case read_rules
    case read_search
    case read_sidebar
    case read_sticky
    case read_subreddits_default
    case read_subreddits_gold
    case read_subreddits_new
    case read_subreddits_popular
    case read_subreddits_search
    case read_subreddits_where
    case read_top
    case read_user_username_about
    case read_sort
    case readreport
    case read_api_hide
    case read_api_live_thread_report
    case read_api_report
    case read_api_unhide
    case save_api_save
    case save_api_saved_categories
    case save_api_store_visits
    case save_api_unsave
    case submitsubmit
    case submit_api_live_create
    case submit_api_live_thread_update
    case submit_api_submit
    case submit_api_submit_text
    case subscribe_api_filter_filterpath
    case subscribe_api_filter_filterpath_r_srname
    case subscribe_api_multi_copy
    case subscribe_api_multi_rename
    case subscribe_api_multi_multipath
    case subscribe_api_multi_multipath_r_srname
    case subscribe_api_subscribe
    case subscribe_api_v1_me_friends_username
    case vote_api_vote
    case votewikiedit
    case vote_api_wiki_edit
    case wikireadwikiread
    case wikiread_wiki_discussions_page
    case wikiread_wiki_pages
    case wikiread_wiki_revisions
    case wikiread_wiki_revisions_page
    case wikiread_wiki_page
    
    
//    case none_api_comment = "/api/comment"
//    case none_api_friend = "/api/friend"
//    case none_api_needs_captcha = "/api/needs_captcha"
//    case none_api_unfriend = "/api/unfriend"
//    case none_api_v1_scopes = "/api/v1/scopes"
//
//    case account_api_v1_me_prefs = "account/api/v1/me/prefs"
//    
//    case creddits_api_v1_gold_gild_fullname = "creddits/api/v1/gold/gild/fullname"
//    case creddits_api_v1_gold_give_username = "creddits/api/v1/gold/give/username"
//    
//    case edit_api_del = "edit/api/del"
//    case edit_api_editusertext = "edit/api/editusertext"
//    case edit_api_live_thread_delete_update = "edit/api/live/thread/delete_update"
//    case edit_api_live_thread_strike_update = "edit/api/live/thread/strike_update"
//    case edit_api_sendreplies = "edit/api/sendreplies"
//    
//    case flair_api_flairselector = "flair/api/flairselector"
//    case flair_api_selectflair = "flair/api/selectflair"
//    case flair_api_setflairenabled = "flair/api/setflairenabled"
//    
//    case history_user_username_comments = "history/user/username/comments"
//    case history_user_username_downvoted = "history/user/username/downvoted"
//    case history_user_username_gilded = "history/user/username/gilded"
//    case history_user_username_hidden = "history/user/username/hidden"
//    case history_user_username_overview = "history/user/username/overview"
//    case history_user_username_saved = "history/user/username/saved"
//    case history_user_username_submitted = "history/user/username/submitted"
//    case history_user_username_upvoted = "history/user/username/upvoted"
//    case history_user_username_where = "history/user/username/where"
//    
//    case identity_api_v1_me = "identity/api/v1/me"
//    case identity_api_v1_me_prefs = "identity/api/v1/me/prefs"
//    case identity_api_v1_me_trophies = "identity/api/v1/me/trophies"
//    
//    case livemanage_api_live_thread_accept_contributor_invite = "livemanage/api/live/thread/accept_contributor_invite"
//    case livemanage_api_live_thread_close_thread = "livemanage/api/live/thread/close_thread"
//    case livemanage_api_live_thread_edit = "livemanage/api/live/thread/edit"
//    case livemanage_api_live_thread_invite_contributor = "livemanage/api/live/thread/invite_contributor"
//    case livemanage_api_live_thread_leave_contributor = "livemanage/api/live/thread/leave_contributor"
//    case livemanage_api_live_thread_rm_contributor = "livemanage/api/live/thread/rm_contributor"
//    case livemanage_api_live_thread_rm_contributor_invite = "livemanage/api/live/thread/rm_contributor_invite"
//    case livemanage_api_live_thread_set_contributor_permissions = "livemanage/api/live/thread/set_contributor_permissions"
//    
//    case mysubreddits_api_v1_me_friends_username = "mysubreddits/api/v1/me/friends/username"
//    case mysubreddits_api_v1_me_karma = "mysubreddits/api/v1/me/karma"
//    case mysubreddits_subreddits_mine_contributor = "mysubreddits/subreddits/mine/contributor"
//    case mysubreddits_subreddits_mine_moderator = "mysubreddits/subreddits/mine/moderator"
//    case mysubreddits_subreddits_mine_subscriber = "mysubreddits/subreddits/mine/subscriber"
//    case mysubreddits_subreddits_mine_where = "mysubreddits/subreddits/mine/where"
//    case mysubredditsprivatemessages = "mysubredditsprivatemessages"
//    case mysubreddits_api_block = "mysubreddits/api/block"
//    case mysubreddits_api_compose = "mysubreddits/api/compose"
//    case mysubreddits_api_del_msg = "mysubreddits/api/del_msg"
//    case mysubreddits_api_read_all_messages = "mysubreddits/api/read_all_messages"
//    case mysubreddits_api_read_message = "mysubreddits/api/read_message"
//    case mysubreddits_api_unblock_subreddit = "mysubreddits/api/unblock_subreddit"
//    case mysubreddits_api_unread_message = "mysubreddits/api/unread_message"
//    case mysubreddits_message_inbox = "mysubreddits/message/inbox"
//    case mysubreddits_message_sent = "mysubreddits/message/sent"
//    case mysubreddits_message_unread = "mysubreddits/message/unread"
//    case mysubreddits_message_where = "mysubreddits/message/where"
//
//    
//    case read_about_banned = "read/about/banned"
//    case read_about_contributors = "read/about/contributors"
//    case read_about_edited = "read/about/edited"
//    case read_about_moderators = "read/about/moderators"
//    case read_about_modqueue = "read/about/modqueue"
//    case read_about_muted = "read/about/muted"
//    case read_about_reports = "read/about/reports"
//    case read_about_spam = "read/about/spam"
//    case read_about_unmoderated = "read/about/unmoderated"
//    case read_about_wikibanned = "read/about/wikibanned"
//    case read_about_wikicontributors = "read/about/wikicontributors"
//    case read_about_location = "read/about/location"
//    case read_about_where = "read/about/where"
//    case read_api_filter_filterpath = "read/api/filter/filterpath"
//    case read_api_filter_filterpath_r_srname = "read/api/filter/filterpath/r/srname"
//    case read_api_info = "read/api/info"
//    case read_api_live_happening_now = "read/api/live/happening_now"
//    case read_api_morechildren = "read/api/morechildren"
//    case read_api_multi_mine = "read/api/multi/mine"
//    case read_api_multi_user_username = "read/api/multi/user/username"
//    case read_api_multi_multipath = "read/api/multi/multipath"
//    case read_api_multi_multipath_description = "read/api/multi/multipath/description"
//    case read_api_multi_multipath_r_srname = "read/api/multi/multipath/r/srname"
//    case read_api_recommend_sr_srnames = "read/api/recommend/sr/srnames"
//    case read_api_search_reddit_names = "read/api/search_reddit_names"
//    case read_api_subreddits_by_topic = "read/api/subreddits_by_topic"
//    case read_api_v1_me_blocked = "read/api/v1/me/blocked"
//    case read_api_v1_me_friends = "read/api/v1/me/friends"
//    case read_api_v1_user_username_trophies = "read/api/v1/user/username/trophies"
//    case read_by_id_names = "read/by_id/names"
//    case read_comments_article = "read/comments/article"
//    case read_controversial = "read/controversial"
//    case read_duplicates_article = "read/duplicates/article"
//    case read_hot = "read/hot"
//    case read_live_thread = "read/live/thread"
//    case read_live_thread_about = "read/live/thread/about"
//    case read_live_thread_contributors = "read/live/thread/contributors"
//    case read_live_thread_discussions = "read/live/thread/discussions"
//    case read_new = "read/new"
//    case read_prefs_blocked = "read/prefs/blocked"
//    case read_prefs_friends = "read/prefs/friends"
//    case read_prefs_where = "read/prefs/where"
//    case read_r_subreddit_about = "read/r/subreddit/about"
//    case read_random = "read/random"
//    case read_rules = "read/rules"
//    case read_search = "read/search"
//    case read_sidebar = "read/sidebar"
//    case read_sticky = "read/sticky"
//    case read_subreddits_default = "read/subreddits/default"
//    case read_subreddits_gold = "read/subreddits/gold"
//    case read_subreddits_new = "read/subreddits/new"
//    case read_subreddits_popular = "read/subreddits/popular"
//    case read_subreddits_search = "read/subreddits/search"
//    case read_subreddits_where = "read/subreddits/where"
//    case read_top = "read/top"
//    case read_user_username_about = "read/user/username/about"
//    case read_sort = "read/sort"
//    case readreport = "readreport"
//    case read_api_hide = "read/api/hide"
//    case read_api_live_thread_report = "read/api/live/thread/report"
//    case read_api_report = "read/api/report"
//    case read_api_unhide = "read/api/unhide"
//    
//    case save_api_save = "save/api/save"
//    case save_api_saved_categories = "save/api/saved_categories"
//    case save_api_store_visits = "save/api/store_visits"
//    case save_api_unsave = "save/api/unsave"
//    
//    case submit_api_live_create = "submit/api/live/create"
//    case submit_api_live_thread_update = "submit/api/live/thread/update"
//    case submit_api_submit = "submit/api/submit"
//    case submit_api_submit_text = "submit/api/submit_text"
//    
//    case subscribe_api_filter_filterpath = "subscribe/api/filter/filterpath"
//    case subscribe_api_filter_filterpath_r_srname = "subscribe/api/filter/filterpath/r/srname"
//    case subscribe_api_multi_copy = "subscribe/api/multi/copy"
//    case subscribe_api_multi_rename = "subscribe/api/multi/rename"
//    case subscribe_api_multi_multipath = "subscribe/api/multi/multipath"
//    case subscribe_api_multi_multipath_r_srname = "subscribe/api/multi/multipath/r/srname"
//    case subscribe_api_subscribe = "subscribe/api/subscribe"
//    case subscribe_api_v1_me_friends_username = "subscribe/api/v1/me/friends/username"
//    
//    case vote_api_vote = "vote/api/vote"
//    case vote_wiki_edit = "vote/wiki/edit"
//    case vote_api_wiki_edit = "vote/api/wiki/edit"
//    
//    case wikiread_wiki_discussions_page = "wikiread/wiki/discussions/page"
//    case wikiread_wiki_pages = "wikiread/wiki/pages"
//    case wikiread_wiki_revisions = "wikiread/wiki/revisions"
//    case wikiread_wiki_revisions_page = "wikiread/wiki/revisions/page"
//    case wikiread_wiki_page = "wikiread/wiki/page"
    
    
    private var baseURLString : String {
     return "https://oauth.reddit.com/"
    }
    
    private var filePath : String{
        return ""
    }
    
    private var apiMappingFileURL : URL?{
        let bundlefilePath = Bundle.main.url(forResource: "RedditApiLookup", withExtension: "plist")
        return bundlefilePath
    }
    
    func getURL() -> URL? {
        
        if let theFileURL = apiMappingFileURL{
            if let apiMapDict = NSDictionary(contentsOf: theFileURL) as? [String:AnyObject]{
                
                if let theValuesD = apiMapDict[self.rawValue] as? [String:AnyObject?]{
                    return URL(string:(baseURLString + (theValuesD["apiURL"] as! String)))
                }
            }
        }
        print("Could not find the URL : Returning Nil")
        return nil
    }
    
    
    
    func  fetchJSONForURL(theURL : URL) -> [String : AnyObject]? {
        
        return [:]
    }
    
}
