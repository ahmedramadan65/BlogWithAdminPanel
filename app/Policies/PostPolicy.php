<?php

namespace App\Policies;

use App\Model\Admin\Admin;
use Illuminate\Auth\Access\HandlesAuthorization;

class PostPolicy
{
    use HandlesAuthorization;

    /**
     * Determine whether the user can view the post.
     *
     * @param  \App\User  $user
     * @param  \App\Post  $post
     * @return mixed
     */
    public function tag(Admin $admin)
    {
        return $this->getPermission($admin,4);
    }

    public function category(Admin $admin)
    {
        return $this->getPermission($admin,5);
    }

    public function view(Admin $admin)
    {
        //
    }

    /**
     * Determine whether the Admin can create posts.
     *
     * @param  \App\Admin  $admin
     * @return mixed
     */
    public function create(Admin $admin)
    {
        return $this->getPermission($admin,6);
    }

    /**
     * Determine whether the Admin can update the post.
     *
     * @param  \App\Admin  $admin
     * @param  \App\Post  $post
     * @return mixed
     */
    public function update(Admin $admin)
    {
        return $this->getPermission($admin,9);
    }

    /**
     * Determine whether the Admin can delete the post.
     *
     * @param  \App\Admin  $admin
     * @param  \App\Post  $post
     * @return mixed
     */
    public function delete(Admin $admin)
    {
        return $this->getPermission($admin,7);
    }

    /**
     * Determine whether the Admin can restore the post.
     *
     * @param  \App\Admin  $admin
     * @param  \App\Post  $post
     * @return mixed
     */
    public function restore(Admin $admin)
    {
        //
    }

    /**
     * Determine whether the user can permanently delete the post.
     *
     * @param  \App\User  $user
     * @param  \App\Post  $post
     * @return mixed
     */
    public function forceDelete(Admin $admin)
    {
        //
    }

    protected function getPermission($admin,$perm_id){
        foreach ($admin->roles as $role) {
            foreach ($role->permissions as $permission) {
                if ($permission->id == $perm_id) {
                    return true;
                }
            }
        }
        return false;
    }

    public function superAdmin(Admin $admin)
    {
        if ($admin->email == 'ahmed.ramadan6565@gmail.com') {
            return true;
        }
        return false;
    }
}
