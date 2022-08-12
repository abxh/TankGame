Vector2 = 
{
	x:0,
	y:0,
	type:0,
}

/// @function 			Vector2(_x,_y);
/// @param	{real}	_x	The x coordinate of the vector
///	@param	{real}	_y	The y coordinate of the vector
function Vector2(_x, _y) constructor
{
	x=_x;
	y=_y;
	type = "vector2";
	
	static Normalize = function() // Makes the vector size 1
	{
		var len = sqrt(x*x + y*y);
		
		if(len!=0) // length is only 0 if both x and y is 0
		{
			x /= len;
			y /= len;
		}
	}

	/// @function				Rotate(angle);
	/// @param	{real}	angle	The angle to rotate vector in radians
	static Rotate = function(angle)
	{
		var arr;
		arr[0][0]=cos(angle);
		arr[0][1]=-sin(angle);
		arr[1][0]=sin(angle);
		arr[1][1]=cos(angle);
		
		var rot_matrix = new Matrix2x2(arr);
		
		var rect = Multiply(rot_matrix, self);
	}
}